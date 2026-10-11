class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.26.2/phasegent-v2.26.2-aarch64-apple-darwin"
      sha256 "02c4a0b772cbdafc2bdc403a6664febd18061f8410219ce9f63eea01b7613290"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.26.2/phasegent-v2.26.2-aarch64-unknown-linux-gnu"
      sha256 "910900e5bb85e7f0ebdfb43def191232d2239163c6bbdead14221745804f4531"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.26.2/phasegent-v2.26.2-x86_64-unknown-linux-gnu"
      sha256 "ee3d99188bd55e2986eefb20ea30bac470f3416dae9425d038e8d618936e2f2b"
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
