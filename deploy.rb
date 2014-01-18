# This script will deploy my compiled blog onto the master branch
require 'fileutils.rb'

puts "> Recompiling static assets"
`ruhoh compile`

Dir.chdir 'compiled'

# Copy CNAME file
FileUtils.cp '../CNAME', 'CNAME'

# Create empty git repo for one off use
puts "> Creating git magic"
`git init`
`git add .`
`git commit -m "update blog"`

# Push to master
puts "> Pushing to Github"
`git push https://github.com/jaimalchohan/jaimalchohan.github.io.git master:master --force`

# Remove .git as we do not want to preserve history of generated files
`rm -rf .git`


