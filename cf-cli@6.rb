require 'formula'

class CfCliAT6 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.24.0&source=homebrew'
  version '6.24.0'
  sha256 'fb1e9e050d63146efd9f9fdcde24cc192e4760d2a79bf8311ed48f13479254c2'

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"
  conflicts_with "caskroom/cask/cloudfoundry-cli", :because => "the caskroom tap is not the official distribution"

  def install
    bin.install 'cf'
    (bash_completion/"cf-cli").write <<-completion
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
