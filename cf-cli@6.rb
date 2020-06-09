require 'formula'

class CfCliAT6 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '6.41.0'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://packages.cloudfoundry.org/homebrew/cf-6.41.0.tgz'
    sha256 'f882c025ba5887c8942055b8a641261d729fec08c35da14290fc5423b9af9f80'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.41.0&source=homebrew'
    sha256 'eedf8567e6a94570ccabc51653eec2a4c739702e03997e21ebfd2f855bb8c18c'
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
