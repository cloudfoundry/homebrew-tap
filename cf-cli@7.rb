require 'formula'

class CfCliAT7 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.1.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.1.0.tgz'
    sha256 '4c5ec5f899f5ddbc5ffe17a53be79d50435c9a0767ec11637b3ea01cce251a1d'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.1.0&source=homebrew'
    sha256 '53f93b3a940566cb1fddfc24f2b3c60528b2516c200c553bd30e0d1e99a09723'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf7'
    bin.install_symlink 'cf7' => 'cf'
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
