### Myanimestats
Inspired by [Myanimelist](https://myanimelist.net/), Myanimestats is a cli tool that helps you organize your anime
You can edit the metadata of animes such as its state (watching/completed/dropped/on hold/plan to watch), seasons, episodes, progress
Myanimestats uses a txt file (animes.txt) as an anime database, but you don't need to edit this file, because the script takes care off adding new anime or editing existing ones

![](https://github.com/Kiefciman/myanimestats/blob/master/myanimestats.gif)

### How to install
- **Linux:**<br>
Dependencies: fzf git<br>
Debian/Ubuntu based distros:
```
sudo apt install fzf git
```
Suse/Fedora based distros:
```
sudo dnf install fzf git
```
Arch based distros:
```
sudo pacman -S fzf git
```
Then clone this repo:
```
git clone https://github.com/Kiefciman/myanimestats.git
```
- **Windows:**<br>
Dependencies: bash fzf git<br>
We are going with scoop<br>
First install scoop:
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```
Then we install fzf and git (this will also install bash):
```
scoop install git
scoop update
scoop install fzf
```
Then open the Bash shell by typing **bash** or set bash as a terminal profile (at the path simply type bash)<br>
Then clone this repo:
```
git clone https://github.com/Kiefciman/myanimestats.git
```
- **Android:**<br>
Not tested yet

### To run the tool
Run the "myanimestats.sh" script
```
cd myanimestats
./myanimestats.sh
```
Also you can use the -s flag to only show your stats
```
./myanimelist.sh -s
```

### Running first time
When you run the script the first time, you will go through a short and simple profile setup process
Then you need to run the script again to actually use it
