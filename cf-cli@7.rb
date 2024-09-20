class CfCliAT7 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "7.7.14"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=7.7.14"
      sha256 "96f5e83c11dfa9c1911acb45f05bfdcac8abe683839f814a1bf0e03cd53da634"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=7.7.14"
      sha256 "49ef7ddf5920c6654df1d48bbc3095c990f15109750000e8b09df08da3cdac1f"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.7.14&source=homebrew"
    sha256 "670502069229ba27299d74693b5842b7b76704afe5a0c34e9ddea1ca1133ab2c"
  end

  def install
    bin.install "cf7"
    bin.install_symlink "cf7" => "cf"
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
    doc.install "LICENSE"
    doc.install "NOTICE"
  end

  test do
    system "#{bin}/cf7"
  end
end
