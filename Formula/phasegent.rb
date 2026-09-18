class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.13.2/phasegent-v2.13.2-aarch64-apple-darwin"
      sha256 "82d9f03d2e488d2351af63df2ecf99636224cd423f86a8a0e77bb2fc5c136d57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.13.2/phasegent-v2.13.2-aarch64-unknown-linux-gnu"
      sha256 "f38e770cb93b57452d875aafc05bfe9f5fb7720d4cec00b7ac23145f617c1a30"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.13.2/phasegent-v2.13.2-x86_64-unknown-linux-gnu"
      sha256 "9429b9aec57ed46706316483d0865be17ebfd63bb14fd3528fccd427e3a6b26d"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
