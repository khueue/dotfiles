abbr c 'clear'
abbr q 'exit'
abbr lla 'ls -al'

function cl
    cd $argv ; ls -l ./
end

abbr khet 'cl ~/Documents/code/personal/khet'
abbr appprojects 'cl ~/Documents/code/personal/khet/app-projects'
abbr webapp 'cl ~/Documents/code/personal/khet/app-projects/web-app'
abbr khetsession 'kitty --session ~/.config/kitty/khet.session'

abbr tphon 'cl ~/Documents/code/personal/tphon'

abbr personal 'cl ~/Documents/code/personal'
abbr vh 'cl ~/Documents/code/work/vh'

abbr bs 'bin/synth'
abbr bt 'bin/tf'
