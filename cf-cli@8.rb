require 'formula'

class CfCliAT8 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '8.1.0'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf8-8.1.0.tgz'
    sha256 'f534f7edc531d4cb43fd9ef216faf2a764ac6fda907216dd4f2299d8f1d7352f'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.1.0&source=homebrew'
    sha256 'dadbb24dba7ef41f935b72f70d66b9b9c78df1781f67682ad0c116be92644693'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf8'
    bin.install_symlink 'cf8' => 'cf'
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
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf8"
  end
end
