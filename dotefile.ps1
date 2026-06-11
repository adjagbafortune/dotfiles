Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Git
winget install --id Git.Git -e --source winget

# Scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
refreshenv

# Visual Studio Code
scoop bucket add extras
scoop install vscode
git config --global core.editor "code --wait"

# Python
winget install Python
refreshenv
$scriptPath = python -c "import sysconfig; print(sysconfig.get_path('scripts'))"
$env:Path += ";$scriptPath"
python -m pip install black requests

# Node.js & pnpm
scoop install nodejs
refreshenv
npm install -g pnpm
pnpm setup
refreshenv

# Nerd Fonts
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Oh My Posh
winget install JanDeDobbeleer.OhMyPosh --source winget
"oh-my-posh init pwsh --config '$pwd/abd_short.omp.json' | Invoke-Expression" >> $PROFILE

# PSReadLine
Install-Module -Name PSReadLine -Scope CurrentUser -Force
'Set-PSReadLineOption -PredictionSource History' >> $PROFILE
'Set-PSReadLineOption -PredictionViewStyle ListView' >> $PROFILE

refreshenv
Write-Host "Installation terminée avec succès ! Redémarrez votre terminal." -ForegroundColor Green