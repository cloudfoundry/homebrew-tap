require 'formula'

class CfCli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '6.35.2'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=macosx64-binary&version=6.35.2&source=homebrew'
    sha256 '2e57da01baea8547a228592df180e53cf7e7a815c387491a2fcd0503f7ae7d4b'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.35.2&source=homebrew'
    sha256 '708a7757d3b3192a40e2cd8073b4f20afc59b7cbb0cb6bd88244268dfc6eb77d'
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
