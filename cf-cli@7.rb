class CfCliAT7 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "7.7.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=7.7.4"
      sha256 "31ef04887b35e16ceb77bd0349a80735bb7015c683f410dc82ad4c6ab781b20a"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=7.7.4"
      sha256 "2c3d22bac2e8aa496fc26727cb90551e543cc419495401383121ac4e507259a1"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.7.4&source=homebrew"
    sha256 "9e6793f8cc1fcee2574e716f2a5bbc3812384fbf08e827fbea6c5e11327f67a7"
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
