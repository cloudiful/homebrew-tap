class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.0/phasegent-v2.20.0-aarch64-apple-darwin"
      sha256 "b99fa19a74c5fe0fbbdab852ba87ed026b15e78688c4c369633c860c234cf553"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.0/phasegent-v2.20.0-aarch64-unknown-linux-gnu"
      sha256 "5ae1515b1338236d5cd3feab8252706d8df263d868b1d5c04f8655cfa30e48ab"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.0/phasegent-v2.20.0-x86_64-unknown-linux-gnu"
      sha256 "307b8da32259f2383b0542bd7b335de471ab20db63cec697d5987e434650fee1"
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
