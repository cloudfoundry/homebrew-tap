require 'formula'

class CfCliAT6 < Formula
  desc "The official command line client for Cloud Foundry"
  homepage 'https://code.cloudfoundry.org/cli'
  version '6.53.0'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.53.0/cf-cli_6.53.0_osx.tgz'
    sha256 '3d5f94759dd4aa135fb10e04c6525f2b747727cbb5789ff1a0aacce365fa9515'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.53.0&source=homebrew'
    sha256 '09664d1469fb8a0ddba804343121aba7d8f64ba6bfde75a53f6e29d6600b2342'
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
