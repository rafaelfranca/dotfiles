function control_db ()
{
  local type="$1"
  local launch_agent=""

  case "$type" in
  "mongo")
    launch_agent=~/Library/LaunchAgents/org.mongodb.mongod.plist
    ;;
  "mysql")
    launch_agent=~/Library/LaunchAgents/com.mysql.mysqld.plist
    ;;
  "mongo")
    launch_agent=~/Library/LaunchAgents/org.postgresql.postgres.plist
    ;;
  * )
    echo "Unknown database"
    return
    ;;
  esac

  local action="$2"
  local launch_command=""

  case "$action" in
  "start")
    launch_command="load -F"
    ;;
  "stop")
    launch_command="unload -w"
    ;;
  * )
    echo "Unknown action"
    return
    ;;
  esac

  launchctl $launch_command $launch_agent
}
