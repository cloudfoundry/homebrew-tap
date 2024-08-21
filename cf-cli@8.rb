class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.8.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.8.0"
      sha256 "c6d3b7effbf66bc4f2e8d251a921c52e0c36e023eafe59b9f9615daabd620d5c"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.8.0"
      sha256 "3fdde659ee270de2bd52133b9351c3d5fdfd844b549ffd2b483dc79e25933c2f"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.8.0&source=homebrew"
    sha256 "fa33d65327e72bc90d9d6f3751aa0a8db3f8168f011740649fa9519c8f0111bb"
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
