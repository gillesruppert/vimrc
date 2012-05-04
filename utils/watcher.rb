#!/usr/bin/env ruby
# watch.rb by Brett Terpstra, 2011 <http://brettterpstra.com>
# with credit to Carlo Zottmann <https://github.com/carlo/haml-sass-file-watcher>
#
# use: ./watcher.rb path/to/watch/ keyword # keyword is part of the url, i.e. localhost

trap("SIGINT") { exit }

if ARGV.length < 2
  puts "Usage: #{$0} watch_folder keyword"
  puts "Example: #{$0} . mywebproject"
  exit
end

dev_extension = 'dev'
filetypes = ['css','html','htm','php','rb','erb','less','js', 'scss']
watch_folder = ARGV[0]
keyword = ARGV[1]
puts "Watching #{watch_folder} and subfolders for changes in project files..."

while true do
  files = []
  filetypes.each {|type|
    files += Dir.glob( File.join( watch_folder, "**", "*.#{type}" ) )
  }
  new_hash = files.collect {|f| [ f, File.stat(f).mtime.to_i ] }
  hash ||= new_hash
  diff_hash = new_hash - hash

  unless diff_hash.empty?
    hash = new_hash

    diff_hash.each do |df|
      puts "Detected change in #{df[0]}, refreshing"
      %x{osascript<<ENDGAME
  tell application "Google Chrome Canary"
    set windowList to every window
    repeat with aWindow in windowList
      set tabList to every tab of aWindow
      repeat with atab in tabList
        if (URL of atab contains "#{keyword}") then
          tell atab to reload
        end if
      end repeat
    end repeat
  end tell
ENDGAME
}
    end
  end

  sleep 1
end

# tell application "Safari"
# 	set windowList to every window
# 	repeat with aWindow in windowList
# 		set tabList to every tab of aWindow
# 		repeat with atab in tabList
# 			if (URL of atab contains "#{keyword}") then
# 			  tell atab to do javascript "window.location.reload()"
# 			end if
# 		end repeat
# 	end repeat
# end tell

# tell application "Google Chrome Canary"
#   set windowList to every window
#   repeat with aWindow in windowList
#     set tabList to every tab of aWindow
#     repeat with atab in tabList
#       if (URL of atab contains "#{keyword}") then
#         tell atab to reload
#       end if
#     end repeat
#   end repeat
# end tell

# tell app "Firefox" to activate
# tell app "System Events"
#   keystroke "r" using command down
#  end tell
