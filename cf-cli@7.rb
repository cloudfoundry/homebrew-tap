require 'formula'

class Cf7CliAT7 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.0.0.tgz'
    sha256 '3f06fb1066b912545a150ee570af04f0a1c3ff7a7414c461e42342d80adfbfab'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0&source=homebrew'
    sha256 '3f06fb1066b912545a150ee570af04f0a1c3ff7a7414c461e42342d80adfbfab'
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
complete -F _cf-cli cf
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf7"
  end
end
