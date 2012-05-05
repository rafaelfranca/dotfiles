# replaces all string matches in files
#
# USAGE:
#    sr $from $to
#    sr $from $to $type
#
# Arguments:
#    $from - from value
#    $to   - to value
#    $type - file type. DEFAULT: *.rb
#
# example:
#    sr foo bar
#    sr foo bar *.css
function sr()
{
  local from=$1
  local to=$2
  local type=${3-*.rb}

  find . -name $type -exec sed -i '' "s/$from/$to/g" {} +
}
