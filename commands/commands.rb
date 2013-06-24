require 'ruble'
require 'ruble/terminal'
require 'ruble/progress'
require 'ruble/ui'
require 'lessconfig'
require 'rexml/document'

include REXML

command 'Compile CSS' do |cmd|
  cmd.input = :none
  cmd.output = :discard
  cmd.scope = :all
  cmd.invoke do |context|

    initial_level = Ruble::Logger.log_level
    Ruble::Logger.log_level = :info

    destinationDir = Less.config('css_destination_folder').to_s
    projectDir = ENV['TM_PROJECT_DIRECTORY'].gsub('\\', '/').gsub(/[\/]+$/, '')
    commandPathLib = ENV['TM_COMMAND_PATH'].gsub('\\', '/').gsub(/[\/]+$/, '').gsub('commands/commands.rb', 'lib/')

    context.exit_show_tool_tip('Failed to load project LESS settings') if destinationDir.nil? || destinationDir.empty? || projectDir.nil? || projectDir.empty?

    if File.directory?(destinationDir) then
      outpuDestinationFolder = destinationDir
    else
      outpuDestinationFolder = projectDir+destinationDir
    end

    xmldoc = Document.new(File.new(projectDir+"/wro.xml"))

    arr = Array.new

    xmldoc.elements.each("/groups/group[child::css]"){|e|
      arr.push e.attributes["name"]
    }

    lessCommand = "java -jar wro4j-runner-1.6.2-jar-with-dependencies.jar --preProcessors lessCss,cssMinJawr"
    lessCommand << " --contextFolder "+projectDir
    lessCommand << " --wroFile "+projectDir+"/wro.xml"
    lessCommand << " --destinationFolder "+outpuDestinationFolder+" -m --targetGroups "+arr.join(',')

    Ruble::Logger.log_info("Start LESS compiler...")

    Ruble::Terminal.open("cd "+commandPathLib)
    Ruble::Terminal.open(lessCommand)

    Ruble::Logger.log_level = initial_level

  end
end

command 'Compile JS' do |cmd|
  cmd.input = :none
  cmd.output = :discard
  cmd.scope = :all
  cmd.invoke do |context|

    initial_level = Ruble::Logger.log_level
    Ruble::Logger.log_level = :info

    destinationDir = Less.config('js_destination_folder').to_s
    projectDir = ENV['TM_PROJECT_DIRECTORY'].gsub('\\', '/').gsub(/[\/]+$/, '')
    commandPathLib = ENV['TM_COMMAND_PATH'].gsub('\\', '/').gsub(/[\/]+$/, '').gsub('commands/commands.rb', 'lib/')

    context.exit_show_tool_tip('Failed to load project LESS settings') if destinationDir.nil? || destinationDir.empty? || projectDir.nil? || projectDir.empty?

    if File.directory?(destinationDir) then
      outpuDestinationFolder = destinationDir
    else
      outpuDestinationFolder = projectDir+destinationDir
    end

    xmldoc = Document.new(File.new(projectDir+"/wro.xml"))

    arr = Array.new

    xmldoc.elements.each("/groups/group[child::js]"){|e|
      arr.push e.attributes["name"]
    }

    lessCommand = "java -jar wro4j-runner-1.6.2-jar-with-dependencies.jar --preProcessors lessCss "
    lessCommand << " --contextFolder "+projectDir
    lessCommand << " --wroFile "+projectDir+"/wro.xml"
    lessCommand << " --destinationFolder "+outpuDestinationFolder
    lessCommand << " --targetGroups "+arr.join(',')+" -m -c jsMin"

    Ruble::Terminal.open("cd "+commandPathLib)
    Ruble::Terminal.open(lessCommand)

    Ruble::Logger.log_level = initial_level

  end
end
