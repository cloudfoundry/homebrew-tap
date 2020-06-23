require 'formula'

class Cf7CliAT7 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.0.0.tgz'
    sha256 '22d08ab06e8868fd5f6f36d1408dcdaaf37ebad8b6d4719f0c703131e0ae358f'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0&source=homebrew'
    sha256 '71b4426531ba0de0c1beaa4cd12a278c6f02dfb6a59e62e80faf162c9b8351fd'
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
