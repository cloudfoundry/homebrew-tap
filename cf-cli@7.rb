class CfCliAT7 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "7.7.11"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=7.7.11"
      sha256 "52cff020b61470661c4526251e0c10b9327cadb56c262d210bfa1c93ced5e5a3"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=7.7.11"
      sha256 "0203cf2af4622bcd2d0a18e683e22c2bcf763d388e433d001a063e5667c5392a"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.7.11&source=homebrew"
    sha256 "ae53cdb542cb0a84d18cf21f2d5c89613caf2a6679e284ae6ef6f3f561e0b09a"
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
