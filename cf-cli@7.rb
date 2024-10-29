class CfCliAT7 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "7.7.15"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=7.7.15"
      sha256 "5116acddd9a3322d8dae86743a357043dddbde0911d7a67dce41d98e6282c203"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=7.7.15"
      sha256 "7b5deadc11d1e4ed598f83ee7fdbce8d115dc4d4084027f5903f829674e2561b"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.7.15&source=homebrew"
    sha256 "938c276d5541fc62d845a4ff9c896f20d4f07765e32315955fcad2e337cbcaea"
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
