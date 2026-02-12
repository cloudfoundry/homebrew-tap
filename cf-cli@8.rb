class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.17.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.17.1"
      sha256 "d1d9900867b7e6dcc78dc06f3dc8f93f7bcf657dc2ebeb00be869cd286df9e20"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.17.1"
      sha256 "5b4c6ebe9aabee9fd3fc8f270feee986f3acb7428d9987f0f1a054d8a08cb690"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.17.1&source=homebrew"
    sha256 "134425b0af46f5892b6e3413580a14a55b27732fa3459a87cd49dbed26c7381c"
  end

  def install
    bin.install "cf8"
    bin.install_symlink "cf8" => "cf"
    (bash_completion/"cf8-cli").write <<-completion
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
complete -F _cf-cli cf8
complete -F _cf-cli cf
    completion
    doc.install "LICENSE"
    doc.install "NOTICE"
  end

  test do
    system "#{bin}/cf8"
  end
end
