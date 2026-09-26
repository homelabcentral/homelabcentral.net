---
title: "Starship"
weight: 4
description: "Cross-shell prompt written in Rust."
---

{{< lead >}}A fast prompt that shows Git state, language versions and context, configured in one TOML file.{{< /lead >}}

{{< badge content="Homebrew formula" color="green" icon="iconify:devicon-plain/homebrew" size="lg" link="https://formulae.brew.sh/formula/starship" >}}

## What it does

Starship renders the prompt: current directory, Git branch and dirty state, the language version relevant to the directory you are in (Go, Node, Python, Rust), Kubernetes context, command duration, exit status. Modules activate only when relevant, so a plain directory gets a plain prompt.

Configuration is a single `~/.config/starship.toml`, and the same binary works in Zsh, Bash, Fish, Nu and PowerShell.

```shell
# ~/.zshrc
eval "$(starship init zsh)"
```

## Notes

Most presets assume a Nerd Font for the glyphs. `starship explain` breaks down what each segment of the current prompt is and what it cost in milliseconds.

## Presets

Nine complete configurations. Each one is a whole `starship.toml` rather than a
patch, so the way to try one is to put it where Starship looks:

```shell
curl -o ~/.config/starship.toml https://homelabcentral.net/downloads/starship/gruvbox.toml
```

To keep several around and switch between them, leave the files wherever you
like and point `STARSHIP_CONFIG` at the one you want:

```shell
export STARSHIP_CONFIG=~/.config/starship/themes/gruvbox.toml
```

All nine draw glyphs from a Nerd Font, and all nine show language versions,
Git state and an exit status when there is one to show. What differs is the
shape: how much of the line the prompt claims, whether segments are filled or
bare, and what gets pushed to the right-hand edge.

### Catppuccin

One continuous pastel powerline on the left and nothing on the right, with the prompt character following the bar on the same line. The directory truncates to its last component.

![The catppuccin prompt in a terminal](/images/starship/catppuccin.png)

{{< button href="/downloads/starship/catppuccin.toml" style="outline" icon="download" >}}catppuccin.toml{{< /button >}}

{{% details title="catppuccin.toml" closed="true" %}}

```toml {filename="catppuccin.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[](red)\
$os\
$username\
[](bg:peach fg:red)\
$directory\
[](bg:yellow fg:peach)\
$git_branch\
$git_status\
[](fg:yellow bg:green)\
$c\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:green bg:sapphire)\
$conda\
[](fg:sapphire bg:lavender)\
$time\
[ ](fg:lavender)\
$cmd_duration\
$line_break\
$character"""

palette = 'catppuccin_mocha'

[os]
disabled = false
style = "bg:red fg:crust"

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[username]
show_always = true
style_user = "bg:red fg:crust"
style_root = "bg:red fg:crust"
format = '[ $user]($style)'

[directory]
style = "bg:peach fg:crust"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:yellow"
format = '[[ $symbol $branch ](fg:crust bg:yellow)]($style)'

[git_status]
style = "bg:yellow"
format = '[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)'

[nodejs]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[c]
symbol = " "
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[rust]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[golang]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[php]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[java]
symbol = " "
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[kotlin]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[haskell]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[python]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:crust bg:green)]($style)'

[docker_context]
symbol = ""
style = "bg:sapphire"
format = '[[ $symbol( $context) ](fg:crust bg:sapphire)]($style)'

[conda]
symbol = "  "
style = "fg:crust bg:sapphire"
format = '[$symbol$environment ]($style)'
ignore_base = false

[time]
disabled = false
time_format = "%R"
style = "bg:lavender"
format = '[[  $time ](fg:crust bg:lavender)]($style)'

[line_break]
disabled = true

[character]
disabled = false
success_symbol = '[❯](bold fg:green)'
error_symbol = '[❯](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = true
format = " in $duration "
style = "bg:lavender"
disabled = false
show_notifications = true
min_time_to_notify = 45000

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
```

{{% /details %}}

### Chai

The same palette as Catppuccin, split into two groups: OS, user, directory, branch and a dedicated exit-status segment on the left, then memory, language version and the clock pinned to the right edge.

![The chai prompt in a terminal](/images/starship/chai.png)

{{< button href="/downloads/starship/chai.toml" style="outline" icon="download" >}}chai.toml{{< /button >}}

{{% details title="chai.toml" closed="true" %}}

```toml {filename="chai.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[](red)\
$os\
$username\
$sudo\
$hostname\
$directory\
[](bg:yellow fg:peach)\
$git_branch\
$git_status\
[](fg:yellow bg:surface0)\
$status\
[](fg:surface0 bg:base)\
$fill\
[](surface0)\
$battery\
[](bg:surface0 fg:yellow)\
$memory_usage\
[](bg:yellow fg:green)\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](bg:green fg:sapphire)\
$conda\
[](bg:sapphire fg:lavender)\
$time\
[](fg:lavender)\
$line_break\
$character"""

# right_format appears in the same line as the prompt, use it carefully
right_format = """
$cmd_duration
"""

palette = 'catppuccin_mocha'

[os]
disabled = false
style = "bg:red fg:crust"

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[fill]
symbol = ' '

[username]
show_always = true
style_user = "bg:red fg:crust"
style_root = "bg:red fg:crust"
format = '[ $user ]($style)'

[directory]
style = "bg:peach fg:crust"
format = "[[](bg:peach fg:red)( $read_only) $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"
truncate_to_repo = true
fish_style_pwd_dir_length = 1
read_only = '󰉐'

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "
"Code" = " "

[git_branch]
symbol = ""
style = "bg:yellow"
format = '[[ $symbol $branch ](fg:crust bg:yellow)]($style)'

[git_status]
style = "bg:yellow"
format = '[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)'

[status]
disabled = false
style = 'fg:green bg:surface0'
success_style = 'fg:green bg:surface0'
failure_style = 'fg:red bg:surface0'
format = '[ $symbol ($status )]($style)'
map_symbol = true
# format = '[$symbol $status]($style)'
symbol = ''
success_symbol = ''
not_executable_symbol = ''
not_found_symbol = '󰦀'
sigint_symbol = '󰗼'
signal_symbol = '󰖔'

[nodejs]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[c]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[cpp]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[rust]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[golang]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[php]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[java]
symbol = "󰅶"
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[kotlin]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[haskell]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'

[python]
symbol = ""
style = "bg:green"
format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:crust bg:green)]($style)'

[docker_context]
symbol = ""
style = "bg:sapphire"
format = '[[ $symbol( $context) ](fg:crust bg:sapphire)]($style)'

[conda]
symbol = "  "
style = "fg:crust bg:sapphire"
format = '[$symbol$environment ]($style)'
ignore_base = false

[time]
disabled = false
use_12hr = true
time_format = "%I:%M %p"
style = "bg:lavender"
format = '[[  $time ](fg:crust bg:lavender)]($style)'

[sudo]
disabled = false
symbol = '󱐋'
#symbol = ''or ''or ''
style = "bg:red fg:crust"
format = '[$symbol ]($style)'

[hostname]
disabled = false
ssh_only = true
ssh_symbol = ''
style = "bg:red fg:crust"
format = '[(@$hostname $symbol )]($style)'

[line_break]
disabled = false

[memory_usage]
disabled = false
threshold = -1
symbol = ''
# format = '[$symbol ${ram} ]($style)'
format = '[ $symbol ${ram_pct} ]($style)'
style = "bg:yellow fg:crust"

[character]
disabled = false
success_symbol = '[](bold fg:green)'
error_symbol = '[](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = false
format = " in $duration "
style = "bg:lavender"
disabled = false
show_notifications = true
min_time_to_notify = 45000
min_time = 2_000

[battery]
disabled = false
format = '[ $symbol $percentage ]($style)'
full_symbol = '󰁹'
charging_symbol = '󰂄'
discharging_symbol = '󰁽'
empty_symbol = '󰂎'
unknown_symbol = '󰂃'

[[battery.display]]
threshold = 100
style = "bold green bg:surface0"
discharging_symbol = '󰂂'
charging_symbol = '󰂅'

[[battery.display]]
threshold = 90
style = "fg:green bg:surface0"
discharging_symbol = '󰂂'
charging_symbol = '󰂋'

[[battery.display]]
threshold = 80
style = "fg:green bg:surface0"
discharging_symbol = '󰂁'
charging_symbol = '󰂊'

[[battery.display]]
threshold = 70
style = "fg:yellow bg:surface0"
discharging_symbol = '󰂀'
charging_symbol = '󰢞'

[[battery.display]]
threshold = 60
style = "fg:yellow bg:surface0"
discharging_symbol = '󰁿'
charging_symbol = '󰂉'

[[battery.display]]
threshold = 50
style = "fg:yellow bg:surface0"
discharging_symbol = '󰁾'
charging_symbol = '󰢝'

[[battery.display]]
threshold = 40
style = "fg:yellow bg:surface0"
discharging_symbol = '󰁽'
charging_symbol = '󰂈'

[[battery.display]]
threshold = 30
style = "fg:peach bg:surface0"
discharging_symbol = '󰁼'
charging_symbol = '󰂇'

[[battery.display]]
threshold = 20
style = "fg:red bg:surface0"
discharging_symbol = '󰁻'
charging_symbol = '󰂆'

[[battery.display]]
threshold = 10
style = "bold red bg:surface0"
discharging_symbol = '󰂃'
charging_symbol = '󰢜'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"
gray = "#1d1d1d"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"
gray = "#1d1d1d"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"
gray = "#1d1d1d"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
gray = "#1d1d1d"```

{{% /details %}}

### Classic

Segment capsules laid over a dark bar that spans the full width of the terminal, so the prompt reads as one band rather than a ribbon. Command duration drops to its own right-aligned line beneath the prompt.

![The classic prompt in a terminal](/images/starship/classic.png)

{{< button href="/downloads/starship/classic.toml" style="outline" icon="download" >}}classic.toml{{< /button >}}

{{% details title="classic.toml" closed="true" %}}

```toml {filename="classic.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[ ](red)\
$os\
[ ](bg:red)\
[](bg:surface0 fg:red)\
$username\
$sudo\
$hostname\
$directory\
$git_branch\
$git_status\
$status\
$fill\
$memory_usage\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
$package\
$conda\
$time\
$battery\
$line_break\
$character"""

# right_format appears in the same line as the prompt, use it carefully
right_format = """
$cmd_duration
"""

add_newline = false

palette = 'catppuccin_mocha'

[os]
disabled = false
style = "bg:red fg:crust"
format = '[ $symbol]($style)'

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[fill]
symbol = ' '
style = 'bg:surface0'

[username]
show_always = true
style_user = "bg:surface0 fg:red"
style_root = "bg:surface0 fg:red"
format = '[ $user ]($style)'

[directory]
style = "bg:surface0 fg:peach"
format = "[[](bg:peach fg:surface0) ($read_only )](bg:peach fg:crust)[󰉋 ](bg:peach fg:crust)[](bg:surface0 fg:peach)[ $path ]($style)"
truncation_length = 3
# truncation_symbol = "…/"
truncate_to_repo = true
fish_style_pwd_dir_length = 1
read_only = ''

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "
"Code" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:surface0 fg:yellow"
format = '[](bg:yellow fg:surface0)[ $symbol ](fg:crust bg:yellow)[](fg:yellow bg:surface0)[ $branch ]($style)'

[git_status]
style = "bg:surface0 fg:yellow"
format = '[[($all_status$ahead_behind )](fg:yellow bg:surface0)]($style)'

[status]
disabled = false
style = 'fg:green bg:surface0'
success_style = 'fg:green bg:surface0'
failure_style = 'fg:red bg:surface0'
format = '[$symbol ($status )]($style)'
map_symbol = true
# format = '[$symbol $status]($style)'
symbol = ''
success_symbol = ''
# success_symbol = '' # settings success symbol to a non-empty character will also fill the $status and it will display the code 0 along with the success symbol
not_executable_symbol = ''
not_found_symbol = '󰦀'
sigint_symbol = '󰗼'
signal_symbol = '󰖔'

[nodejs]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[c]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[cpp]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[rust]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[golang]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[php]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[java]
symbol = "󰅶"
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[kotlin]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[haskell]
symbol = ""
style = "fg:green bg:surface0"
# format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version) ]($style)'

[python]
symbol = ""
style = "fg:green bg:surface0"
# format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:crust bg:green)]($style)'
format = '[[](bg:surface0 fg:green) $symbol ](bg:green fg:crust)[](bg:green fg:surface0)[( $version)(\(#$virtualenv\)) ]($style)'

[package]
disabled = false
symbol = ""
style = "fg:teal bg:surface0"
format = '[](bg:surface0 fg:teal)[ $symbol ](bg:teal fg:crust)[](bg:teal fg:surface0)[( $version )]($style)'


[docker_context]
symbol = ""
style = "bg:sapphire"
format = '[[ $symbol( $context) ](fg:crust bg:sapphire)]($style)'

[conda]
symbol = ""
style = "fg:sapphire bg:surface0"
format = '[[](bg:surface0 fg:sapphire) $symbol ](bg:sapphire fg:crust)[](bg:sapphire fg:surface0)[ $environment ]($style)'
ignore_base = false
disabled = false

[time]
disabled = false
use_12hr = true
time_format = "%I:%M %p"
style = "lavender bg:surface0"
# format = '[[](bg:surface0 fg:lavender)[  $time ](fg:crust bg:lavender)]($style)'
format = '[[](bg:surface0 fg:lavender)[  ](fg:crust bg:lavender)[](bg:lavender fg:surface0) $time ]($style)'

[sudo]
disabled = false
symbol = '󱐋'
#symbol = ''or ''or '' or ''
style = "bg:surface0 fg:red"
format = '[$symbol ]($style)'

[hostname]
disabled = false
ssh_only = true
ssh_symbol = ''
style = "bg:surface0 fg:red"
format = '[(@$hostname )($symbol )]($style)'

[line_break]
disabled = false

[memory_usage]
disabled = false
threshold = -1
symbol = ''
# format = '[$symbol ${ram} ]($style)'
format = '[[](bg:surface0 fg:pink) $symbol ](bg:pink fg:crust)[ ](bg:pink fg:surface0)[ ${ram_pct} ]($style)'
style = "bg:surface0 fg:pink"

[character]
disabled = false
success_symbol = ' [](bold fg:green)'
error_symbol = ' [](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = false
format = " in $duration "
style = "bg:lavender"
disabled = false
show_notifications = true
min_time_to_notify = 45000
min_time = 2_000

[battery]
disabled = false
format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[](inverted $style fg:base)]($style)'
full_symbol = '󰁹'
charging_symbol = '󰂄'
discharging_symbol = '󰁽'
empty_symbol = '󰂎'
unknown_symbol = '󰂃'

[[battery.display]]
threshold = 100
style = "bold surface0 bg:green"
discharging_symbol = '󰂂'
charging_symbol = '󰂅'

[[battery.display]]
threshold = 90
style = "fg:surface0 bg:yellow"
discharging_symbol = '󰂂'
charging_symbol = '󰂋'

[[battery.display]]
threshold = 80
style = "fg:surface0 bg:yellow"
discharging_symbol = '󰂁'
charging_symbol = '󰂊'

[[battery.display]]
threshold = 70
style = "fg:surface0 bg:yellow"
discharging_symbol = '󰂀'
charging_symbol = '󰢞'

[[battery.display]]
threshold = 60
style = "fg:surface0 bg:yellow"
discharging_symbol = '󰁿'
charging_symbol = '󰂉'

[[battery.display]]
threshold = 50
style = "fg:surface0 bg:yellow"
discharging_symbol = '󰁾'
charging_symbol = '󰢝'

[[battery.display]]
threshold = 40
style = "fg:surface0 bg:maroon"
discharging_symbol = '󰁽'
charging_symbol = '󰂈'

[[battery.display]]
threshold = 30
style = "fg:surface0 bg:maroon"
discharging_symbol = '󰁼'
charging_symbol = '󰂇'

[[battery.display]]
threshold = 20
style = "fg:surface0 bg:red"
discharging_symbol = '󰁻'
charging_symbol = '󰂆'

[[battery.display]]
threshold = 10
style = "bold surface0 bg:red"
discharging_symbol = '󰂃'
charging_symbol = '󰢜'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"
gray = "#1d1d1d"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"
gray = "#1d1d1d"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"
gray = "#1d1d1d"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
gray = "#1d1d1d"```

{{% /details %}}

### Gruvbox

Gruvbox oranges, yellows and aquas in a single compact powerline — user, directory, branch, language version, clock — with the right-hand side left empty.

![The gruvbox prompt in a terminal](/images/starship/gruvbox.png)

{{< button href="/downloads/starship/gruvbox.toml" style="outline" icon="download" >}}gruvbox.toml{{< /button >}}

{{% details title="gruvbox.toml" closed="true" %}}

```toml {filename="gruvbox.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[](color_orange)\
$os\
$username\
[](bg:color_yellow fg:color_orange)\
$directory\
[](fg:color_yellow bg:color_aqua)\
$git_branch\
$git_status\
[](fg:color_aqua bg:color_blue)\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:color_blue bg:color_bg3)\
$docker_context\
$conda\
$pixi\
[](fg:color_bg3 bg:color_bg1)\
$time\
[ ](fg:color_bg1)\
$line_break$character"""

palette = 'gruvbox_dark'

[palettes.gruvbox_dark]
color_fg0 = '#fbf1c7'
color_bg1 = '#3c3836'
color_bg3 = '#665c54'
color_blue = '#458588'
color_aqua = '#689d6a'
color_green = '#98971a'
color_orange = '#d65d0e'
color_purple = '#b16286'
color_red = '#cc241d'
color_yellow = '#d79921'

[os]
disabled = false
style = "bg:color_orange fg:color_fg0"

[os.symbols]
Windows = "󰍲"
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
EndeavourOS = ""
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"
Pop = ""

[username]
show_always = true
style_user = "bg:color_orange fg:color_fg0"
style_root = "bg:color_orange fg:color_fg0"
format = '[ $user ]($style)'

[directory]
style = "fg:color_fg0 bg:color_yellow"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:color_aqua"
format = '[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)'

[git_status]
style = "bg:color_aqua"
format = '[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)'

[nodejs]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[c]
symbol = " "
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[cpp]
symbol = " "
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[rust]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[golang]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[php]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[java]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[kotlin]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[haskell]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[python]
symbol = ""
style = "bg:color_blue"
format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

[docker_context]
symbol = ""
style = "bg:color_bg3"
format = '[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)'

[conda]
style = "bg:color_bg3"
format = '[[ $symbol( $environment) ](fg:#83a598 bg:color_bg3)]($style)'

[pixi]
style = "bg:color_bg3"
format = '[[ $symbol( $version)( $environment) ](fg:color_fg0 bg:color_bg3)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:color_bg1"
format = '[[  $time ](fg:color_fg0 bg:color_bg1)]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[](bold fg:color_green)'
error_symbol = '[](bold fg:color_red)'
vimcmd_symbol = '[](bold fg:color_green)'
vimcmd_replace_one_symbol = '[](bold fg:color_purple)'
vimcmd_replace_symbol = '[](bold fg:color_purple)'
vimcmd_visual_symbol = '[](bold fg:color_yellow)'
```

{{% /details %}}

### Jetpack

No powerline at all. Context is right-aligned and dimmed, the prompt itself is a bare glyph at the left margin, and container or Nix-shell state sits on a line above.

![The jetpack prompt in a terminal](/images/starship/jetpack.png)

{{< button href="/downloads/starship/jetpack.toml" style="outline" icon="download" >}}jetpack.toml{{< /button >}}

{{% details title="jetpack.toml" closed="true" %}}

```toml {filename="jetpack.toml"}
# version: 1.0.0
"$schema" = 'https://starship.rs/config-schema.json'

add_newline = true
continuation_prompt = "[▸▹ ](dimmed white)"

format = """($nix_shell$container$fill$git_metrics\n)$cmd_duration\
$hostname\
$localip\
$shlvl\
$shell\
$env_var\
$jobs\
$sudo\
$username\
$character"""

right_format = """
$singularity\
$kubernetes\
$directory\
$vcsh\
$fossil_branch\
$git_branch\
$git_commit\
$git_state\
$git_status\
$hg_branch\
$pijul_channel\
$docker_context\
$package\
$c\
$cpp\
$cmake\
$cobol\
$daml\
$dart\
$deno\
$dotnet\
$elixir\
$elm\
$erlang\
$fennel\
$fortran\
$golang\
$guix_shell\
$haskell\
$haxe\
$helm\
$java\
$julia\
$kotlin\
$gradle\
$lua\
$nim\
$nodejs\
$ocaml\
$opa\
$perl\
$php\
$pulumi\
$purescript\
$python\
$raku\
$rlang\
$red\
$ruby\
$rust\
$scala\
$solidity\
$swift\
$terraform\
$vlang\
$vagrant\
$xmake\
$zig\
$buf\
$conda\
$pixi\
$meson\
$spack\
$memory_usage\
$aws\
$gcloud\
$openstack\
$azure\
$crystal\
$custom\
$status\
$os\
$battery\
$time"""

[fill]
symbol = ' '

[character]
format = "$symbol "
success_symbol = "[◎](bold italic bright-yellow)"
error_symbol = "[○](italic purple)"
vimcmd_symbol = "[■](italic dimmed green)"
# not supported in zsh
vimcmd_replace_one_symbol = "◌"
vimcmd_replace_symbol = "□"
vimcmd_visual_symbol = "▼"

[env_var.VIMSHELL]
format = "[$env_value]($style)"
style = 'green italic'

[sudo]
format = "[$symbol]($style)"
style = "bold italic bright-purple"
symbol = "⋈┈"
disabled = false

[username]
style_user = "bright-yellow bold italic"
style_root = "purple bold italic"
format = "[⭘ $user]($style) "
disabled = false
show_always = false

[directory]
home_symbol = "⌂"
truncation_length = 2
truncation_symbol = "□ "
read_only = " ◈"
use_os_path_sep = true
style = "italic blue"
format = '[$path]($style)[$read_only]($read_only_style)'
repo_root_style = 'bold blue'
repo_root_format = '[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) [△](bold bright-blue)'

[cmd_duration]
format = "[◄ $duration ](italic white)"

[jobs]
format = "[$symbol$number]($style) "
style = "white"
symbol = "[▶](blue italic)"

[localip]
ssh_only = true
format = " ◯[$localipv4](bold magenta)"
disabled = false

[time]
disabled = false
format = "[ $time]($style)"
time_format = "%R"
utc_time_offset = "local"
style = "italic dimmed white"

[battery]
format = "[ $percentage $symbol]($style)"
full_symbol = "█"
charging_symbol = "[↑](italic bold green)"
discharging_symbol = "↓"
unknown_symbol = "░"
empty_symbol = "▃"

[[battery.display]]
threshold = 20
style = "italic bold red"

[[battery.display]]
threshold = 60
style = "italic dimmed bright-purple"

[[battery.display]]
threshold = 70
style = "italic dimmed yellow"

[git_branch]
format = " [$branch(:$remote_branch)]($style)"
symbol = "[△](bold italic bright-blue)"
style = "italic bright-blue"
truncation_symbol = "⋯"
truncation_length = 11
ignore_branches = ["main", "master"]
only_attached = true

[git_metrics]
format = '([▴$added]($added_style))([▿$deleted]($deleted_style))'
added_style = 'italic dimmed green'
deleted_style = 'italic dimmed red'
ignore_submodules = true
disabled = false

[git_status]
style = "bold italic bright-blue"
format = "([⎪$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed⎥]($style))"
conflicted = "[◪◦](italic bright-magenta)"
ahead = "[▴│[${count}](bold white)│](italic green)"
behind = "[▿│[${count}](bold white)│](italic red)"
diverged = "[◇ ▴┤[${ahead_count}](regular white)│▿┤[${behind_count}](regular white)│](italic bright-magenta)"
untracked = "[◌◦](italic bright-yellow)"
stashed = "[◃◈](italic white)"
modified = "[●◦](italic yellow)"
staged = "[▪┤[$count](bold white)│](italic bright-cyan)"
renamed = "[◎◦](italic bright-blue)"
deleted = "[✕](italic red)"

[deno]
format = " [deno](italic) [∫ $version](green bold)"
version_format = "${raw}"

[lua]
format = " [lua](italic) [${symbol}${version}]($style)"
version_format = "${raw}"
symbol = "⨀ "
style = "bold bright-yellow"

[nodejs]
format = " [node](italic) [◫ ($version)](bold bright-green)"
version_format = "${raw}"
detect_files = ["package-lock.json", "yarn.lock"]
detect_folders = ["node_modules"]
detect_extensions = []

[python]
format = " [py](italic) [${symbol}${version}]($style)"
symbol = "[⌉](bold bright-blue)⌊ "
version_format = "${raw}"
style = "bold bright-yellow"

[ruby]
format = " [rb](italic) [${symbol}${version}]($style)"
symbol = "◆ "
version_format = "${raw}"
style = "bold red"

[rust]
format = " [rs](italic) [$symbol$version]($style)"
symbol = "⊃ "
version_format = "${raw}"
style = "bold red"

[package]
format = " [pkg](italic dimmed) [$symbol$version]($style)"
version_format = "${raw}"
symbol = "◨ "
style = "dimmed yellow italic bold"

[swift]
format = " [sw](italic) [${symbol}${version}]($style)"
symbol = "◁ "
style = "bold bright-red"
version_format = "${raw}"

[aws]
disabled = true
format = " [aws](italic) [$symbol $profile $region]($style)"
style = "bold blue"
symbol = "▲ "

[buf]
symbol = "■ "
format = " [buf](italic) [$symbol $version $buf_version]($style)"

[c]
symbol = "ℂ "
format = " [$symbol($version(-$name))]($style)"

[cpp]
symbol = "ℂ "
format = " [$symbol($version(-$name))]($style)"

[conda]
symbol = "◯ "
format = " conda [$symbol$environment]($style)"

[pixi]
symbol = "■ "
format = " pixi [$symbol$version ($environment )]($style)"

[dart]
symbol = "◁◅ "
format = " dart [$symbol($version )]($style)"

[docker_context]
symbol = "◧ "
format = " docker [$symbol$context]($style)"

[elixir]
symbol = "△ "
format = " exs [$symbol $version OTP $otp_version ]($style)"

[elm]
symbol = "◩ "
format = " elm [$symbol($version )]($style)"

[golang]
symbol = "∩ "
format = " go [$symbol($version )]($style)"

[haskell]
symbol = "❯λ "
format = " hs [$symbol($version )]($style)"

[java]
symbol = "∪ "
format = " java [${symbol}(${version} )]($style)"

[julia]
symbol = "◎ "
format = " jl [$symbol($version )]($style)"

[memory_usage]
symbol = "▪▫▪ "
format = " mem [${ram}( ${swap})]($style)"

[nim]
symbol = "▴▲▴ "
format = " nim [$symbol($version )]($style)"

[nix_shell]
style = 'bold italic dimmed blue'
symbol = '✶'
format = '[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)'
impure_msg = '[⌽](bold dimmed red)'
pure_msg = '[⌾](bold dimmed green)'
unknown_msg = '[◌](bold dimmed yellow)'

[spack]
symbol = "◇ "
format = " spack [$symbol$environment]($style)"
```

{{% /details %}}

### Minimal

Plain text, no backgrounds, and no user or host: directory, branch and status on the left, the language version alone on the right.

![The minimal prompt in a terminal](/images/starship/minimal.png)

{{< button href="/downloads/starship/minimal.toml" style="outline" icon="download" >}}minimal.toml{{< /button >}}

{{% details title="minimal.toml" closed="true" %}}

```toml {filename="minimal.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
$os\
$username\
$sudo\
$hostname\
$directory\
$git_branch\
$git_status\
$status\
$fill\
$cmd_duration\
$docker_context\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
$package\
$conda\
$memory_usage\
$battery\
$time\
$line_break\
$character"""

# # right_format appears in the same line as the prompt, use it carefully
# right_format = """
# $cmd_duration
# """

add_newline = false

palette = 'catppuccin_mocha'

[fill]
symbol = ' '
style = ''

[os]
disabled = true
style = "fg:flamingo"
format = '[ $symbol ]($style)'

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[username]
show_always = true
style_user = "fg:red"
style_root = "fg:red bold"
format = '[ $user ]($style)'
disabled = true

[sudo]
disabled = true
symbol = ' 󱐋󱐋'
#symbol = ''or ''or '' or ''
style = "fg:red"
format = '[$symbol ]($style)'

[hostname]
disabled = true
ssh_only = true
trim_at = "."
ssh_symbol = '' # '󰌘' or '󰢹'
style = "fg:red"
format = '[(@ $hostname ($ssh_symbol ))]($style)'
# format = '[(@ $hostname ($ssh_symbol ))]($style)'
# format = '[(@ $hostname )[$ssh_symbol]]($style)'
# format = '@ ($ssh_symbol )([$hostname]($style))'

[directory]
style = "fg:peach"
format = "[( $read_only)](fg:peach)[ $path ]($style)"
truncation_length = 1
# truncation_symbol = "…/"
truncate_to_repo = true
# fish_style_pwd_dir_length = 1
read_only = ''
disabled = false

[directory.substitutions]
"Documents" = "󰈙"
"Downloads" = ""
"Music" = "󰝚"
"Pictures" = ""
"Developer" = "󰲋"
"Code" = "󰲋"

[git_branch]
symbol = ""
style = "fg:yellow"
format = '[ $symbol](fg:yellow)[ $branch ]($style)'
disabled = false

[git_status]
style = "fg:yellow"
format = '[(\[$all_status$ahead_behind\])]($style)'
disabled = false

[status]
disabled = false
style = 'fg:green'
success_style = 'fg:green'
failure_style = 'fg:red'
format = '[ $symbol ($status )]($style)'
map_symbol = true
# format = '[$symbol $status]($style)'
symbol = ''
success_symbol = ''
# success_symbol = '' # settings success symbol to a non-empty character will also fill the $status and it will display the code 0 along with the success symbol
not_executable_symbol = ''
not_found_symbol = '󰦀'
sigint_symbol = '󰗼'
signal_symbol = '󰖔'

[nodejs]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[c]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[cpp]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[rust]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[golang]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[php]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[java]
symbol = "󰅶"
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[kotlin]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[haskell]
symbol = ""
style = "fg:green"
# format = '[[ $symbol( $version) ](fg:green)]($style)'
format = '[ $symbol $version ]($style)'
disabled = false

[python]
symbol = ""
style = "fg:green"
# format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:green)]($style)'
format = '[ $symbol $version(#$virtualenv) ]($style)'
disabled = false

[package]
disabled = false
symbol = ""
style = "fg:teal"
format = '[ $symbol( $version) ]($style)'

[docker_context]
symbol = ""
style = "fg:sapphire"
format = '[ $symbol( $context) ]($style)'
disabled = false

[conda]
symbol = ""
style = "fg:sapphire"
format = '[ $symbol $environment ]($style)'
ignore_base = false
disabled = false

[battery]
disabled = true
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
full_symbol = '󰁹'
charging_symbol = '󰂄'
discharging_symbol = '󰁽'
empty_symbol = '󰂎'
unknown_symbol = '󰂃'
format = '[ $symbol $percentage ]($style)'

[[battery.display]]
threshold = 100
style = "fg:flamingo"
discharging_symbol = '󰁹'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 90
style = "fg:flamingo"
discharging_symbol = '󰂂'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 80
style = "fg:flamingo"
discharging_symbol = '󰂁'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 70
style = "fg:flamingo"
discharging_symbol = '󰂀'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 60
style = "fg:flamingo"
discharging_symbol = '󰁿'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 50
style = "fg:flamingo"
discharging_symbol = '󰁾'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 40
style = "bold fg:flamingo"
discharging_symbol = '󰁽'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 30
style = "bold fg:flamingo"
discharging_symbol = '󰁼'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 20
style = "bold fg:flamingo"
discharging_symbol = '󰁻'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 10
style = "bold fg:flamingo"
discharging_symbol = '󰁺'
charging_symbol = '󰂄'

[time]
disabled = true
use_12hr = true
time_format = "%I:%M %p"
style = "fg:lavender"
format = '[ $time ]($style)'
# format = '[[](fg:lavender)[  ](fg:crust bg:lavender)$time ]($style)[](bg:base fg:lavender)'

[line_break]
disabled = false

[memory_usage]
disabled = true
threshold = -1
symbol = ''
style = "fg:pink"
# format = '[$symbol ${ram} ]($style)'
format = '[ $symbol ${ram_pct} ]($style)'

[character]
disabled = false
success_symbol = ' [](bold fg:green)'
error_symbol = ' [](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = false
style = "fg:text"
format = "[  in $duration ]($style)"
disabled = false
show_notifications = false
min_time_to_notify = 45000
min_time = 2_000

# [battery]
# disabled = false
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
# full_symbol = '󰁹'
# charging_symbol = '󰂄'
# discharging_symbol = '󰁽'
# empty_symbol = '󰂎'
# unknown_symbol = '󰂃'

# [[battery.display]]
# threshold = 100
# style = "bold surface0 bg:green"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂅'

# [[battery.display]]
# threshold = 90
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂋'

# [[battery.display]]
# threshold = 80
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂁'
# charging_symbol = '󰂊'

# [[battery.display]]
# threshold = 70
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂀'
# charging_symbol = '󰢞'

# [[battery.display]]
# threshold = 60
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁿'
# charging_symbol = '󰂉'

# [[battery.display]]
# threshold = 50
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁾'
# charging_symbol = '󰢝'

# [[battery.display]]
# threshold = 40
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁽'
# charging_symbol = '󰂈'

# [[battery.display]]
# threshold = 30
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁼'
# charging_symbol = '󰂇'

# [[battery.display]]
# threshold = 20
# style = "bold fg:surface0 bg:red"
# discharging_symbol = '󰁻'
# charging_symbol = '󰂆'

# [[battery.display]]
# threshold = 10
# style = "bold surface0 bg:red"
# discharging_symbol = '󰂃'
# charging_symbol = '󰢜'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"
gray = "#1d1d1d"
pale_violet = "#dc7684"
burly_wood = "#e4ca99"
light_steel_blue = "#a4c9d7"
steel_blue = "#2d7f9d"
powder_blue = "#aedde0"
pale_golden_rod = "#f1d7bb"
tan = "#d3c99f"
thistle = "#cba6f7"
light_thisle = "#e8cedb"
beige = "#f3ece4"
light_steel_green = "#cce0db"
steel_green = "#b8d1cb"
light_coral = "#f39ca4"
very_light_coral = "#fadae2"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"
gray = "#1d1d1d"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"
gray = "#1d1d1d"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
gray = "#1d1d1d"
```

{{% /details %}}

### Pure

Plain text like Minimal, with the context filled back in — OS, user, directory and branch on the left; language version, memory and the clock on the right.

![The pure prompt in a terminal](/images/starship/pure.png)

{{< button href="/downloads/starship/pure.toml" style="outline" icon="download" >}}pure.toml{{< /button >}}

{{% details title="pure.toml" closed="true" %}}

```toml {filename="pure.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
$os\
$username\
$sudo\
$hostname\
$directory\
$git_branch\
$git_status\
$status\
$fill\
$cmd_duration\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
$package\
$conda\
$memory_usage\
$battery\
$time\
$line_break\
$character"""

# # right_format appears in the same line as the prompt, use it carefully
# right_format = """
# """

add_newline = false

palette = 'catppuccin_mocha'

[fill]
symbol = ' '
style = ''

[os]
disabled = false
style = "fg:flamingo"
format = '[ $symbol ]($style)'

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[username]
show_always = true
style_user = "fg:red"
style_root = "fg:red bold"
format = '[ $user ]($style)'
disabled = false

[sudo]
disabled = false
symbol = '󱐋󱐋'
#symbol = ''or ''or '' or ''
style = "fg:red"
format = '[$symbol ]($style)'

[hostname]
disabled = false
ssh_only = true
trim_at = "."
ssh_symbol = '' # '󰌘' or '󰢹'
style = "fg:red"
format = '[(@ $hostname $ssh_symbol )]($style)'
# format = '[(@ $hostname ($ssh_symbol ))]($style)'
# format = '[(@ $hostname )[$ssh_symbol]]($style)'
# format = '@ ($ssh_symbol )([$hostname]($style))'

[directory]
style = "fg:peach"
format = "[( $read_only)](fg:peach)[ $path ]($style)"
truncation_length = 3
# truncation_symbol = "…/"
truncate_to_repo = true
fish_style_pwd_dir_length = 1
read_only = ''
disabled = false

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "
"Code" = "󰲋 "

[git_branch]
symbol = ""
style = "fg:yellow"
format = '[ $symbol](fg:yellow)[ $branch ]($style)'
disabled = false

[git_status]
style = "fg:yellow"
format = '[(\[$all_status$ahead_behind\])]($style)'
disabled = false

[status]
disabled = false
style = 'fg:green'
success_style = 'fg:green'
failure_style = 'fg:red'
format = '[ $symbol ($status )]($style)'
map_symbol = true
# format = '[$symbol $status]($style)'
symbol = ''
success_symbol = ''
# success_symbol = '' # settings success symbol to a non-empty character will also fill the $status and it will display the code 0 along with the success symbol
not_executable_symbol = ''
not_found_symbol = '󰦀'
sigint_symbol = '󰗼'
signal_symbol = '󰖔'

[nodejs]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[c]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[cpp]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[rust]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[golang]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[php]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[java]
symbol = "󰅶"
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[kotlin]
symbol = ""
style = "fg:green"
format = '[ $symbol $version ]($style)'
disabled = false

[haskell]
symbol = ""
style = "fg:green"
# format = '[[ $symbol( $version) ](fg:green)]($style)'
format = '[ $symbol $version ]($style)'
disabled = false

[python]
symbol = ""
style = "fg:green"
# format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:green)]($style)'
format = '[ $symbol $version(#$virtualenv) ]($style)'
disabled = false

[package]
disabled = false
symbol = ""
style = "fg:teal"
format = '[ $symbol( $version) ]($style)'

[docker_context]
symbol = ""
style = "fg:sapphire"
format = '[ $symbol( $context) ]($style)'
disabled = false

[conda]
symbol = ""
style = "fg:sapphire"
format = '[ $symbol $environment ]($style)'
ignore_base = false
disabled = false

[battery]
disabled = false
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
full_symbol = '󰁹'
charging_symbol = '󰂄'
discharging_symbol = '󰁽'
empty_symbol = '󰂎'
unknown_symbol = '󰂃'
format = '[ $symbol $percentage ]($style)'

[[battery.display]]
threshold = 100
style = "fg:flamingo"
discharging_symbol = '󰁹'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 90
style = "fg:flamingo"
discharging_symbol = '󰂂'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 80
style = "fg:flamingo"
discharging_symbol = '󰂁'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 70
style = "fg:flamingo"
discharging_symbol = '󰂀'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 60
style = "fg:flamingo"
discharging_symbol = '󰁿'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 50
style = "fg:flamingo"
discharging_symbol = '󰁾'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 40
style = "bold fg:flamingo"
discharging_symbol = '󰁽'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 30
style = "bold fg:flamingo"
discharging_symbol = '󰁼'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 20
style = "bold fg:flamingo"
discharging_symbol = '󰁻'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 10
style = "bold fg:flamingo"
discharging_symbol = '󰁺'
charging_symbol = '󰂄'

[time]
disabled = false
use_12hr = true
time_format = "%I:%M %p"
style = "fg:lavender"
format = '[ $time ]($style)'
# format = '[[](fg:lavender)[  ](fg:crust bg:lavender)$time ]($style)[](bg:base fg:lavender)'

[line_break]
disabled = false

[memory_usage]
disabled = false
threshold = -1
symbol = ''
style = "fg:pink"
# format = '[$symbol ${ram} ]($style)'
format = '[ $symbol ${ram_pct} ]($style)'

[character]
disabled = false
success_symbol = ' [](bold fg:green)'
error_symbol = ' [](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = false
style = "fg:text"
format = "[  in $duration ]($style)"
disabled = false
show_notifications = false
min_time_to_notify = 45000
min_time = 2_000

# [battery]
# disabled = false
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
# full_symbol = '󰁹'
# charging_symbol = '󰂄'
# discharging_symbol = '󰁽'
# empty_symbol = '󰂎'
# unknown_symbol = '󰂃'

# [[battery.display]]
# threshold = 100
# style = "bold surface0 bg:green"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂅'

# [[battery.display]]
# threshold = 90
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂋'

# [[battery.display]]
# threshold = 80
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂁'
# charging_symbol = '󰂊'

# [[battery.display]]
# threshold = 70
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂀'
# charging_symbol = '󰢞'

# [[battery.display]]
# threshold = 60
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁿'
# charging_symbol = '󰂉'

# [[battery.display]]
# threshold = 50
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁾'
# charging_symbol = '󰢝'

# [[battery.display]]
# threshold = 40
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁽'
# charging_symbol = '󰂈'

# [[battery.display]]
# threshold = 30
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁼'
# charging_symbol = '󰂇'

# [[battery.display]]
# threshold = 20
# style = "bold fg:surface0 bg:red"
# discharging_symbol = '󰁻'
# charging_symbol = '󰂆'

# [[battery.display]]
# threshold = 10
# style = "bold surface0 bg:red"
# discharging_symbol = '󰂃'
# charging_symbol = '󰢜'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"
gray = "#1d1d1d"
pale_violet = "#dc7684"
burly_wood = "#e4ca99"
light_steel_blue = "#a4c9d7"
steel_blue = "#2d7f9d"
powder_blue = "#aedde0"
pale_golden_rod = "#f1d7bb"
tan = "#d3c99f"
thistle = "#cba6f7"
light_thisle = "#e8cedb"
beige = "#f3ece4"
light_steel_green = "#cce0db"
steel_green = "#b8d1cb"
light_coral = "#f39ca4"
very_light_coral = "#fadae2"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"
gray = "#1d1d1d"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"
gray = "#1d1d1d"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
gray = "#1d1d1d"
```

{{% /details %}}

### Rainbow

A different pastel per segment, filled edge to edge, in two groups with the exit status between them. The loudest of the nine.

![The rainbow prompt in a terminal](/images/starship/rainbow.png)

{{< button href="/downloads/starship/rainbow.toml" style="outline" icon="download" >}}rainbow.toml{{< /button >}}

{{% details title="rainbow.toml" closed="true" %}}

```toml {filename="rainbow.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[ ](flamingo)\
$os\
[](fg:flamingo)\
$username\
$sudo\
$hostname\
[](fg:red)\
$directory\
$git_branch\
$git_status\
$status\
$fill\
$cmd_duration\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
$package\
$conda\
$memory_usage\
$battery\
$time\
$line_break\
$character"""

# # right_format appears in the same line as the prompt, use it carefully
# right_format = """
# """

add_newline = false

palette = 'catppuccin_mocha'

[os]
disabled = false
style = "bg:flamingo fg:crust"
format = '[ $symbol ]($style)'

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[fill]
symbol = ' '
style = ''

[username]
show_always = true
style_user = "bg:red fg:crust"
style_root = "bg:red fg:crust"
format = '[](fg:red)[ $user ]($style)'
disabled = false

[directory]
style = "bg:peach fg:crust"
format = "[[](fg:peach) ($read_only )](bg:peach fg:crust)[󰉋 ](bg:peach fg:crust)[$path ]($style)[](fg:peach)"
truncation_length = 3
# truncation_symbol = "…/"
truncate_to_repo = true
fish_style_pwd_dir_length = 1
read_only = ''
disabled = false

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "
"Code" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:yellow fg:crust"
format = '[](fg:yellow )[ $symbol](fg:crust bg:yellow)[ $branch ]($style)'
disabled = false

[git_status]
style = "bg:yellow fg:crust"
format = '[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)[](fg:yellow)'
disabled = false

[status]
disabled = false
style = 'fg:green'
success_style = 'fg:green'
failure_style = 'fg:red'
format = '[ $symbol ($status )]($style)'
map_symbol = true
# format = '[$symbol $status]($style)'
symbol = ''
success_symbol = ''
# success_symbol = '' # settings success symbol to a non-empty character will also fill the $status and it will display the code 0 along with the success symbol
not_executable_symbol = ''
not_found_symbol = '󰦀'
sigint_symbol = '󰗼'
signal_symbol = '󰖔'

[nodejs]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[c]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[cpp]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[rust]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[golang]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[php]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[java]
symbol = "󰅶"
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[kotlin]
symbol = ""
style = "fg:crust bg:green"
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[haskell]
symbol = ""
style = "fg:crust bg:green"
# format = '[[ $symbol( $version) ](fg:crust bg:green)]($style)'
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version) ]($style)[](fg:green)'
disabled = false

[python]
symbol = ""
style = "fg:crust bg:green"
# format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:crust bg:green)]($style)'
format = '[[](fg:green) $symbol](bg:green fg:crust)[( $version)(\(#$virtualenv\)) ]($style)[](fg:green)'
disabled = false

[package]
disabled = false
symbol = ""
style = "fg:crust bg:teal"
format = '[](fg:teal)[ $symbol](bg:teal fg:crust)[( $version )]($style)[](fg:teal)'


[docker_context]
symbol = ""
style = "bg:sapphire"
format = '[[ $symbol( $context) ](fg:crust bg:sapphire)]($style)'
disabled = false

[conda]
symbol = ""
style = "fg:crust bg:sapphire"
format = '[[](fg:sapphire) $symbol](bg:sapphire fg:crust)[ $environment ]($style)[](fg:sapphire)'
ignore_base = false
disabled = false

[time]
disabled = false
use_12hr = true
time_format = "%I:%M %p"
style = "fg:crust bg:lavender"
# format = '[[](bg:surface0 fg:lavender)[  $time ](fg:crust bg:lavender)]($style)'
format = '[[](fg:lavender)[  ](fg:crust bg:lavender)$time ]($style)[](bg:base fg:lavender)'

[sudo]
disabled = false
symbol = '󱐋󱐋'
#symbol = ''or ''or '' or ''
style = "bg:red fg:crust"
format = '[$symbol ]($style)'

[hostname]
disabled = false
ssh_only = false
ssh_symbol = '' # '󰌘' or '󰢹'
style = "bg:red fg:crust"
format = '[(@ $hostname) $ssh_symbol ]($style)'

[line_break]
disabled = false

[memory_usage]
disabled = false
threshold = -1
symbol = ''
# format = '[$symbol ${ram} ]($style)'
format = '[[](fg:pink) $symbol](bg:pink fg:crust)[ ${ram_pct} ]($style)[](fg:pink)'
style = "bg:pink fg:crust"

[character]
disabled = false
success_symbol = ' [](bold fg:green)'
error_symbol = ' [](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = false
format = "[  in $duration ]($style)"
style = ""
disabled = false
show_notifications = false
min_time_to_notify = 45000
min_time = 2_000

[battery]
disabled = false
format = '[](fg:flamingo)[ $symbol $percentage ]($style fg:crust)[](fg:flamingo)'
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
full_symbol = '󰁹'
charging_symbol = '󰂄'
discharging_symbol = '󰁽'
empty_symbol = '󰂎'
unknown_symbol = '󰂃'

[[battery.display]]
threshold = 100
style = "bg:flamingo"
discharging_symbol = '󰁹'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 90
style = "fg:surface0 bg:flamingo"
discharging_symbol = '󰂂'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 80
style = "fg:surface0 bg:flamingo"
discharging_symbol = '󰂁'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 70
style = "fg:surface0 bg:flamingo"
discharging_symbol = '󰂀'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 60
style = "fg:surface0 bg:flamingo"
discharging_symbol = '󰁿'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 50
style = "fg:surface0 bg:flamingo"
discharging_symbol = '󰁾'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 40
style = "bold fg:surface0 bg:flamingo"
discharging_symbol = '󰁽'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 30
style = "bold fg:surface0 bg:flamingo"
discharging_symbol = '󰁼'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 20
style = "bold fg:surface0 bg:flamingo"
discharging_symbol = '󰁻'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 10
style = "bold surface0 bg:flamingo"
discharging_symbol = '󰁺'
charging_symbol = '󰂄'

# [battery]
# disabled = false
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
# full_symbol = '󰁹'
# charging_symbol = '󰂄'
# discharging_symbol = '󰁽'
# empty_symbol = '󰂎'
# unknown_symbol = '󰂃'

# [[battery.display]]
# threshold = 100
# style = "bold surface0 bg:green"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂅'

# [[battery.display]]
# threshold = 90
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂋'

# [[battery.display]]
# threshold = 80
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂁'
# charging_symbol = '󰂊'

# [[battery.display]]
# threshold = 70
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂀'
# charging_symbol = '󰢞'

# [[battery.display]]
# threshold = 60
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁿'
# charging_symbol = '󰂉'

# [[battery.display]]
# threshold = 50
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁾'
# charging_symbol = '󰢝'

# [[battery.display]]
# threshold = 40
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁽'
# charging_symbol = '󰂈'

# [[battery.display]]
# threshold = 30
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁼'
# charging_symbol = '󰂇'

# [[battery.display]]
# threshold = 20
# style = "bold fg:surface0 bg:red"
# discharging_symbol = '󰁻'
# charging_symbol = '󰂆'

# [[battery.display]]
# threshold = 10
# style = "bold surface0 bg:red"
# discharging_symbol = '󰂃'
# charging_symbol = '󰢜'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"
gray = "#1d1d1d"
pale_violet = "#dc7684"
burly_wood = "#e4ca99"
light_steel_blue = "#a4c9d7"
steel_blue = "#2d7f9d"
powder_blue = "#aedde0"
pale_golden_rod = "#f1d7bb"
tan = "#d3c99f"
thistle = "#cba6f7"
light_thisle = "#e8cedb"
beige = "#f3ece4"
light_steel_green = "#cce0db"
steel_green = "#b8d1cb"
light_coral = "#f39ca4"
very_light_coral = "#fadae2"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"
gray = "#1d1d1d"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"
gray = "#1d1d1d"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
gray = "#1d1d1d"
```

{{% /details %}}

### Rainbox

Rainbow's layout with the fill taken out: every segment shares one dark background and only the text carries the colour. Not a typo for Rainbow — a quieter variant of it.

![The rainbox prompt in a terminal](/images/starship/rainbox.png)

{{< button href="/downloads/starship/rainbox.toml" style="outline" icon="download" >}}rainbox.toml{{< /button >}}

{{% details title="rainbox.toml" closed="true" %}}

```toml {filename="rainbox.toml"}
"$schema" = 'https://starship.rs/config-schema.json'

format = """
[ ](fg:surface0)\
$os\
[](fg:surface0)\
$username\
$sudo\
$hostname\
[](fg:surface0)\
$directory\
$git_branch\
$git_status\
$status\
$fill\
$cmd_duration\
$c\
$cpp\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
$package\
$conda\
$memory_usage\
$battery\
$time\
$line_break\
$character"""

# # right_format appears in the same line as the prompt, use it carefully
# right_format = """
# """

add_newline = false

palette = 'catppuccin_mocha'

[os]
disabled = false
style = "bg:surface0 fg:text"
format = '[ $symbol ]($style)'

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[fill]
symbol = ' '
style = ''

[username]
show_always = true
style_user = "bg:surface0 fg:red"
style_root = "bg:surface0 fg:red bold"
format = '[](fg:surface0)[ $user ]($style)'
disabled = false

[directory]
style = "bg:surface0 fg:peach"
format = "[[](fg:surface0) ($read_only )](bg:surface0 fg:peach)[󰉋 ](bg:surface0 fg:peach)[$path ]($style)[](fg:surface0)"
truncation_length = 3
# truncation_symbol = "…/"
truncate_to_repo = true
fish_style_pwd_dir_length = 1
read_only = ''
disabled = false

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "
"Code" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:surface0 fg:yellow"
format = '[](fg:surface0 )[ $symbol](fg:yellow bg:surface0)[ $branch ]($style)'
disabled = false

[git_status]
style = "bg:surface0 fg:yellow"
format = '[[($all_status$ahead_behind )](fg:yellow bg:surface0)]($style)[](fg:surface0)'
disabled = false

[status]
disabled = false
style = 'fg:green'
success_style = 'fg:green'
failure_style = 'fg:red'
format = '[ $symbol ($status )]($style)'
map_symbol = true
# format = '[$symbol $status]($style)'
symbol = ''
success_symbol = ''
# success_symbol = '' # settings success symbol to a non-empty character will also fill the $status and it will display the code 0 along with the success symbol
not_executable_symbol = ''
not_found_symbol = '󰦀'
sigint_symbol = '󰗼'
signal_symbol = '󰖔'

[nodejs]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[c]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[cpp]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[rust]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[golang]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[php]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[java]
symbol = "󰅶"
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[kotlin]
symbol = ""
style = "fg:green bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[haskell]
symbol = ""
style = "fg:green bg:surface0"
# format = '[[ $symbol( $version) ](fg:green bg:surface0)]($style)'
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version) ]($style)[](fg:surface0)'
disabled = false

[python]
symbol = ""
style = "fg:green bg:surface0"
# format = '[[ $symbol( $version)(\(#$virtualenv\)) ](fg:green bg:surface0)]($style)'
format = '[[](fg:surface0) $symbol](bg:surface0 fg:green)[( $version)(\(#$virtualenv\)) ]($style)[](fg:surface0)'
disabled = false

[package]
disabled = false
symbol = ""
style = "fg:teal bg:surface0"
format = '[](fg:surface0)[ $symbol](bg:surface0 fg:teal)[( $version )]($style)[](fg:surface0)'


[docker_context]
symbol = ""
style = "bg:surface0"
format = '[[](fg:surface0)[ $symbol( $context) ](fg:sapphire bg:surface0)[](fg:surface0)]($style)'
disabled = false

[conda]
symbol = ""
style = "fg:sapphire bg:surface0"
format = '[[](fg:surface0) $symbol](bg:surface0 fg:sapphire)[ $environment ]($style)[](fg:surface0)'
ignore_base = false
disabled = false

[time]
disabled = false
use_12hr = true
time_format = "%I:%M %p"
style = "fg:lavender bg:surface0"
# format = '[[](bg:surface0 fg:lavender)[  $time ](fg:crust bg:lavender)]($style)'
format = '[[](fg:surface0)[  ](fg:lavender bg:surface0)$time ]($style)[](fg:surface0)'

[sudo]
disabled = false
symbol = '󱐋󱐋'
#symbol = ''or ''or '' or '' or '󱐋' or '' or '' or '󰒘'
style = "bg:surface0 fg:red"
format = '[$symbol ]($style)'

[hostname]
disabled = false
ssh_only = true
ssh_symbol = '' # '󰌘' or '󰢹' or ''
style = "bg:surface0 fg:red"
format = '[(@ $hostname) $ssh_symbol ]($style)'

[line_break]
disabled = false

[memory_usage]
disabled = false
threshold = -1
symbol = ''
# format = '[$symbol ${ram} ]($style)'
format = '[[](fg:surface0) $symbol](bg:surface0 fg:pink)[ ${ram_pct} ]($style)[](fg:surface0)'
style = "bg:surface0 fg:pink"

[character]
disabled = false
success_symbol = ' [](bold fg:green)'
error_symbol = ' [](bold fg:red)'
vimcmd_symbol = '[❮](bold fg:green)'
vimcmd_replace_one_symbol = '[❮](bold fg:lavender)'
vimcmd_replace_symbol = '[❮](bold fg:lavender)'
vimcmd_visual_symbol = '[❮](bold fg:yellow)'

[cmd_duration]
show_milliseconds = false
format = "[  in $duration ]($style)"
style = ""
disabled = false
show_notifications = false
min_time_to_notify = 45000
min_time = 2_000

[battery]
disabled = false
format = '[](fg:surface0)[ $symbol $percentage ]($style fg:pink)[](fg:surface0)'
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
full_symbol = '󰁹'
charging_symbol = '󰂄'
discharging_symbol = '󰁽'
empty_symbol = '󰂎'
unknown_symbol = '󰂃'

[[battery.display]]
threshold = 100
style = "fg:pink bg:surface0"
discharging_symbol = '󰁹'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 90
style = "fg:pink bg:surface0"
discharging_symbol = '󰂂'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 80
style = "fg:pink bg:surface0"
discharging_symbol = '󰂁'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 70
style = "fg:pink bg:surface0"
discharging_symbol = '󰂀'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 60
style = "fg:pink bg:surface0"
discharging_symbol = '󰁿'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 50
style = "fg:pink bg:surface0"
discharging_symbol = '󰁾'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 40
style = "bold fg:pink bg:surface0"
discharging_symbol = '󰁽'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 30
style = "bold fg:pink bg:surface0"
discharging_symbol = '󰁼'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 20
style = "bold fg:pink bg:surface0"
discharging_symbol = '󰁻'
charging_symbol = '󰂄'

[[battery.display]]
threshold = 10
style = "bold fg:pink bg:surface0"
discharging_symbol = '󰁺'
charging_symbol = '󰂄'

# [battery]
# disabled = false
# format = '[[](inverted $style)[ $symbol $percentage ]($style fg:crust)[]($style fg:surface0)]($style)'
# full_symbol = '󰁹'
# charging_symbol = '󰂄'
# discharging_symbol = '󰁽'
# empty_symbol = '󰂎'
# unknown_symbol = '󰂃'

# [[battery.display]]
# threshold = 100
# style = "bold surface0 bg:green"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂅'

# [[battery.display]]
# threshold = 90
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂂'
# charging_symbol = '󰂋'

# [[battery.display]]
# threshold = 80
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂁'
# charging_symbol = '󰂊'

# [[battery.display]]
# threshold = 70
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰂀'
# charging_symbol = '󰢞'

# [[battery.display]]
# threshold = 60
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁿'
# charging_symbol = '󰂉'

# [[battery.display]]
# threshold = 50
# style = "fg:surface0 bg:yellow"
# discharging_symbol = '󰁾'
# charging_symbol = '󰢝'

# [[battery.display]]
# threshold = 40
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁽'
# charging_symbol = '󰂈'

# [[battery.display]]
# threshold = 30
# style = "bold fg:surface0 bg:maroon"
# discharging_symbol = '󰁼'
# charging_symbol = '󰂇'

# [[battery.display]]
# threshold = 20
# style = "bold fg:surface0 bg:red"
# discharging_symbol = '󰁻'
# charging_symbol = '󰂆'

# [[battery.display]]
# threshold = 10
# style = "bold surface0 bg:red"
# discharging_symbol = '󰂃'
# charging_symbol = '󰢜'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"
gray = "#1d1d1d"
pale_violet = "#dc7684"
burly_wood = "#e4ca99"
light_steel_blue = "#a4c9d7"
steel_blue = "#2d7f9d"
powder_blue = "#aedde0"
pale_golden_rod = "#f1d7bb"
tan = "#d3c99f"
thistle = "#cba6f7"
light_thisle = "#e8cedb"
beige = "#f3ece4"
light_steel_green = "#cce0db"
steel_green = "#b8d1cb"
light_coral = "#f39ca4"
very_light_coral = "#fadae2"

[palettes.catppuccin_frappe]
rosewater = "#f2d5cf"
flamingo = "#eebebe"
pink = "#f4b8e4"
mauve = "#ca9ee6"
red = "#e78284"
maroon = "#ea999c"
peach = "#ef9f76"
yellow = "#e5c890"
green = "#a6d189"
teal = "#81c8be"
sky = "#99d1db"
sapphire = "#85c1dc"
blue = "#8caaee"
lavender = "#babbf1"
text = "#c6d0f5"
subtext1 = "#b5bfe2"
subtext0 = "#a5adce"
overlay2 = "#949cbb"
overlay1 = "#838ba7"
overlay0 = "#737994"
surface2 = "#626880"
surface1 = "#51576d"
surface0 = "#414559"
base = "#303446"
mantle = "#292c3c"
crust = "#232634"
gray = "#1d1d1d"

[palettes.catppuccin_latte]
rosewater = "#dc8a78"
flamingo = "#dd7878"
pink = "#ea76cb"
mauve = "#8839ef"
red = "#d20f39"
maroon = "#e64553"
peach = "#fe640b"
yellow = "#df8e1d"
green = "#40a02b"
teal = "#179299"
sky = "#04a5e5"
sapphire = "#209fb5"
blue = "#1e66f5"
lavender = "#7287fd"
text = "#4c4f69"
subtext1 = "#5c5f77"
subtext0 = "#6c6f85"
overlay2 = "#7c7f93"
overlay1 = "#8c8fa1"
overlay0 = "#9ca0b0"
surface2 = "#acb0be"
surface1 = "#bcc0cc"
surface0 = "#ccd0da"
base = "#eff1f5"
mantle = "#e6e9ef"
crust = "#dce0e8"
gray = "#1d1d1d"

[palettes.catppuccin_macchiato]
rosewater = "#f4dbd6"
flamingo = "#f0c6c6"
pink = "#f5bde6"
mauve = "#c6a0f6"
red = "#ed8796"
maroon = "#ee99a0"
peach = "#f5a97f"
yellow = "#eed49f"
green = "#a6da95"
teal = "#8bd5ca"
sky = "#91d7e3"
sapphire = "#7dc4e4"
blue = "#8aadf4"
lavender = "#b7bdf8"
text = "#cad3f5"
subtext1 = "#b8c0e0"
subtext0 = "#a5adcb"
overlay2 = "#939ab7"
overlay1 = "#8087a2"
overlay0 = "#6e738d"
surface2 = "#5b6078"
surface1 = "#494d64"
surface0 = "#363a4f"
base = "#24273a"
mantle = "#1e2030"
crust = "#181926"
gray = "#1d1d1d"
```

{{% /details %}}

## Alternative to

{{< borderless-table >}}
| Alternative | Type | Trade-off |
| --- | --- | --- |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Open source | Zsh-only, extremely fast, with a guided configuration wizard |
| [oh-my-posh](https://ohmyposh.dev/) | Open source | The same cross-shell idea, from the PowerShell world |
| [pure](https://github.com/sindresorhus/pure) and [spaceship-prompt](https://spaceship-prompt.sh/) | Open source | Zsh prompts, minimal and maximal respectively |
| A hand-written `PS1` | — | No dependency, and instant |
{{< /borderless-table >}}

## Install

{{< tabs >}}
{{< tab name="Homebrew" selected=true >}}

```shell
brew install starship
```

{{< /tab >}}
{{< tab name="Install script" >}}

```shell
curl -sS https://starship.rs/install.sh | sh
```

{{< /tab >}}
{{< /tabs >}}

## Links

{{< cards cols="2" >}}
{{< card link="https://starship.rs/" title="Homepage" icon="globe-alt" subtitle="Official site" >}}
{{< card link="https://formulae.brew.sh/formula/starship" title="Homebrew formula" icon="terminal" subtitle="Formula definition and versions" >}}
{{< card link="https://github.com/starship/starship" title="Repository" icon="github" subtitle="Source code" >}}
{{< card link="https://starship.rs/config/" title="Documentation" icon="book-open" subtitle="Documentation" >}}
{{< /cards >}}
