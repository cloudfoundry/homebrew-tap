class CfCliAT7 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "7.6.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=7.6.0"
      sha256 "2041934af56fde366b467d43a58a70e6dafd8aa66ed9734917c82ca1ae04153e"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=7.6.0"
      sha256 "cf2984cdf84f5f1e64be0b7bc38e46517a447bdd403506dcd0d55db48d6128dc"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.6.0&source=homebrew"
    sha256 "32824fcf1df0f5845f8cbdb396789599817f69aeb16e8071b5aff8ecab706adc"
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
