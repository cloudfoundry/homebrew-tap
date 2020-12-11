require 'formula'

class CfCliAT7 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.2.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.2.0.tgz'
    sha256 '3a012800ee33e79f7146d362f9859325d27e1e9c4620770c7f5121a6a9a50968'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.2.0&source=homebrew'
    sha256 'e7e6284ebc3c9002681a924c199ea4a79ff22f8a5820afe24a1bae8142143332'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf7'
    bin.install_symlink 'cf7' => 'cf'
    (bash_completion/"cf7-cli").write <<-completion
# bash completion for Cloud Foundry CLI

_cf-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _cf-cli cf7
complete -F _cf-cli cf
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf7"
  end
end
