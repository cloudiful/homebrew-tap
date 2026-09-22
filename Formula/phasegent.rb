class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.2/phasegent-v2.18.2-aarch64-apple-darwin"
      sha256 "bcb010fac1cf7f2a00b8a4d5ad4ad0cc0c11d935ad1f54cde21ad3c3853b475d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.2/phasegent-v2.18.2-aarch64-unknown-linux-gnu"
      sha256 "f59e048b7b23f0948cc66cf7fc28658c8810422d1416fa226f56369c0b372471"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.2/phasegent-v2.18.2-x86_64-unknown-linux-gnu"
      sha256 "370644fc487bcdb878c4fbe43f2214d4bce2c07ee8824ab7fe3a1e2b4587d00f"
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
