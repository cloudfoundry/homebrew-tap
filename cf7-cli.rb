require 'formula'

class Cf7Cli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0-beta.10'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://packages.cloudfoundry.org/homebrew/cf-7.0.0-beta.10.tgz'
    sha256 '6da9f2e7d51e2b8f05313e76da0081073be0f59b3c50a28a5b345dc8f368953d'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0-beta.10&source=homebrew'
    sha256 '17de93fc7abea452a068abd9a60e44fde73e21b260c91a6c7f8ba86f7b056cfe'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf7'
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
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf7"
  end
end
