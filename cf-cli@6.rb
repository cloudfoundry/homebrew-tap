require 'formula'

class CfCliAT6 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '6.47.2'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://packages.cloudfoundry.org/homebrew/cf-6.47.2.tgz'
    sha256 'dfe3d7ec65ac380f0f8f72994a8764c5f5d5e65f83bc56bd7700862b9b3c7e6e'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.47.2&source=homebrew'
    sha256 'b9cd5c866259b6e3d6b22a1dd00c3ee5ed9b599fb40a143be0ced116e8631a81'
  end

  depends_on :arch => :x86_64

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
