require 'formula'

class Cf7Cli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.0-beta.2'

  if OS.mac?
    head 'https://packages.cloudfoundry.org/edge?arch=macosx64&source=homebrew'
    url 'https://packages.cloudfoundry.org/homebrew/cf-7.0.0-beta.2.tgz'
    sha256 'd5f765a973bf988b5bf19777a6ad437ab322c626a553941ad9d0faa24b705c72'
  elsif OS.linux?
    head 'https://packages.cloudfoundry.org/edge?arch=linux64&source=homebrew'
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.0-beta.2&source=homebrew'
    sha256 'b6c8270f47a1d78e953b9e5f5c761dde9118760da188246f3d627cc2742efb44'
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
