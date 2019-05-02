require 'formula'

class Cf7Cli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0-beta.21'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://packages.cloudfoundry.org/homebrew/cf-7.0.0-beta.21.tgz'
    sha256 'd33ebd5fa707a5e274bb5347bf3a0a3c374743dae402d526bf639b420c1277f1'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0-beta.21&source=homebrew'
    sha256 'e0cee0190364c235136aabf5a8b2456baa02f6b3ff701065f019b3026e0bf04c'
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
