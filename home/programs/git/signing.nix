_: {
  home.file.".ssh/allowed_signers".text = "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIINhWby7lUUXQNKbRu9/UOrGjWDf3fvoAwGHomWv/+lL";
  programs.git.settings = {
    commit.gpgsign = true;
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    gpg.format = "null";
    user.signingkey = "~/.ssh/key.pub";
  };
  programs.git.signing.format = "openpgp";
}
