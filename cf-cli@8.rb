require 'formula'

class CfCliAT8 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '8.3.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf8-8.3.0.tgz'
    sha256 '390d12106309a93cb78bc687fcdfd123f06bdcf954708abb47861f8fe1c213bc'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.3.0&source=homebrew'
    sha256 '5d2e9b1ef129a84a63f2fc6c429146c7b23ea8dba172a8b1c6f1cb1c8867eb0e'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf8'
    bin.install_symlink 'cf8' => 'cf'
    (bash_completion/"cf8-cli").write <<-completion
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
complete -F _cf-cli cf8
complete -F _cf-cli cf
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf8"
  end
end
