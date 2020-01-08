require 'formula'

class Cf7Cli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0-beta.28'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.0.0-beta.28.tgz'
    sha256 '28696d861d6f8bf3ea4e78712d12267ae0dcf09223ab060286fd8dafcc0fae6b'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0-beta.28&source=homebrew'
    sha256 '794cba101f53e96c72155fb82e9e8a2a7ad3db40a9d11204beb20ff3375f6ff8'
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
