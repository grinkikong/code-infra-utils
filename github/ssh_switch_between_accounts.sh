chek if ssh-agent is running
#eval "$(ssh-agent -s)"

# create a new ssh key
ssh-keygen -t rsa -b 4096 -C

#add the new public key to github account manually

add the new ssh key to the ssh-agent
ssh-add ~/.ssh/id_rsa_work


#check the file
cat ~/.ssh/config

#should look like this for 2 accounts
Host github.com-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_work
  AddKeysToAgent yes
  UseKeychain yes

Host github.com-stas
  HostName github.com
  User git
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519_github_new

# check if connected to the right account
ssh -T git@github.com-work

#one more check
git remote -v

# switch between accounts for existing repos
git remote set-url origin git@github.com-work:EdgeGamingGG/data-infra-eventflow.git

# for new repos
git clone git@github.com-work:EdgeGamingGG/data-infra-eventflow.git