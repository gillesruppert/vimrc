from subprocess import call

browser_command = """
tell application "Google Chrome Canary" to tell the active tab of its first window
    reload
end tell
tell application "Google Chrome Canary" to activate
"""
call(['osascript', '-e', browser_command])
