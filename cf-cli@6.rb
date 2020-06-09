require 'formula'

class CfCliAT6 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  version '6.32.0'
  if OS.mac?
    url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.32.0&source=homebrew'
    sha256 'ddbe83ac8cfe6249431d5a50d5193d127d840fa592261b7050accc2b9757d727'
  elsif OS.linux?
    url 'https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.32.0&source=homebrew'
    sha256 '0a05521b7198dc8b92efbfb02a8fb04c84eeffeded3387aa3c9eb92ce4abef69'
  end

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"
  conflicts_with "caskroom/cask/cloudfoundry-cli", :because => "the caskroom tap is not the official distribution"

  def install
    bin.install 'cf'
    (bash_completion/"cf-cli").write <<-completion
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
complete -F _cf-cli cf
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf"
  end
end
