class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.22.1/phasegent-v2.22.1-aarch64-apple-darwin"
      sha256 "71dae45c205514ea1203cffee21f3b751eca76bc50074c154e265a7b110f8338"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.22.1/phasegent-v2.22.1-aarch64-unknown-linux-gnu"
      sha256 "4af5717d8f62a5b92be173794190c71f26092d24dd6c310493037b003fe041a2"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.22.1/phasegent-v2.22.1-x86_64-unknown-linux-gnu"
      sha256 "fea66c750d8db329b30ac8f704e30c346f6db1849d75fc82c7f9d40463c6c1f5"
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
