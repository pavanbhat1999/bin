#!/usr/bin/env bash

# ╔╦╗ ╦ ╦ ╔═╗ ╦ ╔═╗
# ║║║ ║ ║ ╚═╗ ║ ║
# ╩ ╩ ╚═╝ ╚═╝ ╩ ╚═╝

# author	Niraj
# github	niraj998

# ┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
# │  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││└─┐
# └─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘└─┘

# uncomment your music players below.
#

[ -n "$(pgrep spotify)" ] && Control="spotify"
[ -n "$(pgrep spotify_player)" ] && Control="spotify_player"
# [ -n "$(pgrep brave-bin)" ] && Control="brave-bin"
# [ -n "$(pgrep rhythmbox)" ] && Control="rhythmbox"
# [ -n "$(pgrep audacious)" ] && Control="audacious"
# [ -n "$(pgrep clementine)" ] && Control="clementine"
# [ -n "$(pgrep strawberry)" ] && Control="strawberry"

# saves covers here
Cover=/tmp/cover.png
# if cover not found in metadata use this instead
bkpCover=/home/root99/Downloads/tmpWall/goku's.jpg

# ┌─┐┬  ┌─┐┬ ┬┌─┐┬─┐┌─┐┌┬┐┬    ┌─┐┌─┐┬─┐┬┌─┐┌┬┐┌─┐
# ├─┘│  ├─┤└┬┘├┤ ├┬┘│   │ │    └─┐│  ├┬┘│├─┘ │ └─┐
# ┴  ┴─┘┴ ┴ ┴ └─┘┴└─└─┘ ┴ ┴─┘  └─┘└─┘┴└─┴┴   ┴ └─┘

########################## Title ##########################
title() {
	title=$(playerctl --player=$Control metadata --format {{title}})
	[ -z "$title" ] && title="Play Something"
	echo "$title"
}

########################## Artist ##########################
artist() {
	artist=$(playerctl --player=$Control metadata --format {{artist}})
	[ -z "$artist" ] && artist="Artist"
	echo "$artist"
}

########################## Album ##########################
album() {
	album=$(playerctl --player=$Control metadata --format {{album}})
	[ -z "$album" ] && album="Album"
	echo "$album"
}

########################## Status ##########################
status() {
	status=$(playerctl --player=$Control status)
	[ -z "$status" ] && status="Stopped"
	echo "$status"
}

########################## Time ##########################
position() {
	time=$(playerctl --player=$Control position --format "{{ duration(position) }}")
	[ -z "$time" ] && time="00:00"
	echo "$time"
}

positions() {
  position=$(playerctl --player=$Control metadata --format "{{ duration(position) }}")
  [ -z "$position" ] && position="00:00"
  time=$position
  if [[ $time == *:* ]]; then
    minutes=${time%%:*}
    seconds=${time#*:}
    seconds=$((${seconds#0}))
  else
    minutes=${time:0:1}
    seconds=${time:2:2}
  fi
  total_seconds=$((minutes * 60 + seconds))
  echo $total_seconds
}

########################## Length ##########################
length() {
	length=$(playerctl --player=$Control metadata --format "{{ duration(mpris:length) }}")
	[ -z "$length" ] && length="00:00"
	echo "$length"
}

lengths() {
  length=$(playerctl --player=$Control metadata --format "{{ duration(mpris:length) }}")
  [ -z "$length" ] && length="00:00"
  time=$length
  if [[ $time == *:* ]]; then
    minutes=${time%%:*}
    seconds=${time#*:}
  else
    minutes=${time:0:1}
    seconds=${time:2:2}
  fi
  total_seconds=$((minutes * 60 + seconds))
  echo $total_seconds
}

########################## trackNumber ##########################
playlist() {
	playlist=$(playerctl --player=$Control metadata xesam:trackNumber)
	[ -z "$playlist" ] && playlist="0"
	echo "$playlist"
}

########################## Cover ##########################
cover() {
	albumart="$(playerctl --player=$Control metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
	[ $(playerctl --player=$Control metadata mpris:artUrl) ] && curl -s "$albumart" --output $Cover || cp $bkpCover $Cover
	echo "$Cover"
}

########################## Statusicon ##########################
statusicon() {
	icon=" "
	[ $(playerctl --player=$Control status) = "Playing" ] && icon=" "
	[ $(playerctl --player=$Control status) = "Paused" ] && icon=" "
	echo "$icon"
}

########################## Shuffle ##########################
shufflecolor() {
	color="#a0a0a0"
	[ $(playerctl --player=$Control shuffle) = "On" ] && color="#9ec49f"
	[ $(playerctl --player=$Control shuffle) = "Off" ] && color"#a0a0a0"
	echo "$color"
}

########################## Loop ##########################
loopicon() {
	icon=""
	[ $(playerctl --player=$Control loop) = "None" ] && icon=""
	[ $(playerctl --player=$Control loop) = "Track" ] && icon""
	[ $(playerctl --player=$Control loop) = "Playlist" ] && icon=""
	echo "$icon"
}

loopcheck() {
	command=$(playerctl -p spotify loop)

	if [[ $command == "None" ]]; then
		playerctl -p spotify loop Playlist
	fi

	if [[ $command == "Playlist" ]]; then
		playerctl -p spotify loop Track
	fi

	if [[ $command == "Track" ]]; then
		playerctl -p spotify loop None
	fi
}

loopcolor() {
	color="#9ec49f"
	[ $(playerctl --player=$Control loop) = "None" ] && color="#a0a0a0"
	[ $(playerctl --player=$Control loop) = "Track" ] && color"#9ec49f"
	[ $(playerctl --player=$Control loop) = "Playlist" ] && color"#9ec49f"
	echo "$color"
}

########################## Lyrics ##########################
lyrics() {
	Title=$(playerctl --player=$Control metadata --format {{title}})
	Artist=$(playerctl --player=$Control metadata --format {{artist}})
	URL="https://api.lyrics.ovh/v1/$Artist/$Title"
	lyrics=$(curl -s "$(echo "$URL" | sed s/" "/%20/g | sed s/"&"/%26/g | sed s/,/%2C/g | sed s/-/%2D/g)" | jq '.lyrics')
	[ "$lyrics" = "null" ] && lyrics=$(curl -s --get "https://makeitpersonal.co/lyrics" --data-urlencode "artist=$Artist" --data-urlencode "title=$Title")
	printf "$lyrics" | less
}

# ┬ ┬┌─┐┬  ┌─┐
# ├─┤├┤ │  ├─┘
# ┴ ┴└─┘┴─┘┴

doc() {
	echo "Usage:
  MediaControl [Options]

Options:
  --previous	previous song
  --next	next song
  --toggle	toggle between play-pause song
  --stop	stop song
  --shuffle	shuffle playlist
  --loop	loop None Playlist Track
  title		shows title of current song
  album		shows album of current song
  artist	shows artist of current song
  status	music status (playing/paused/stopped)
  statusicon	music status icons (playing/paused/stopped)
  shufflecolor	shuffle status color
  loopicon	loop status icon
  loopcolor	loop status color
  coverloc	saves cover and shows location to cover of current song
  showcover	opens cover using feh
  position		shows current position of song
  positions		shows current position of song in seconds
  length	shows length of song
  lengths	shows length of song in seconds
  playlist	shows playlist position of current song
  lyrics	shows lyrics"
}

# ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
# │ │├─┘ │ ││ ││││└─┐
# └─┘┴   ┴ ┴└─┘┘└┘└─┘

	case $1 in
	--next) playerctl --player=$Control next ;;
	--previous) playerctl --player=$Control previous ;;
	--toggle) playerctl --player=$Control play-pause ;;
	--stop) playerctl --player=$Control stop ;;
	--shuffle) playerctl --player=$Control shuffle toggle ;;
	--loop) loopcheck ;;
	title) title ;;
	artist) artist ;;
	album) album ;;
	status) status ;;
	statusicon) statusicon ;;
	shufflecolor) shufflecolor ;;
	loopicon) loopicon ;;
	loopcolor) loopcolor ;;
	player) echo "$Control" ;;
	coverloc) cover ;;
	showcover) cover | xargs sxiv ;;
	position) position ;;
	positions) positions;;
	length) length ;;
	lengths) lengths ;;
	playlist) playlist ;;
	lyrics) lyrics ;;
	*) doc ;;
	esac
