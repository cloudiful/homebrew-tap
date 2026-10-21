class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.2/phasegent-v2.28.2-aarch64-apple-darwin"
      sha256 "224a96cde01ae29cc835544950544717192094ec7e41b8be2eb3b6cacaf96978"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.2/phasegent-v2.28.2-aarch64-unknown-linux-gnu"
      sha256 "a3954de185b0d6d1adda7fb7b64bd0ec24716a1ae5d06efd4f729e63d58675d9"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.2/phasegent-v2.28.2-x86_64-unknown-linux-gnu"
      sha256 "5d6985dded729bc7368dc829ffd246132986545df1afc6c09a8a1a81b7cd9ae9"
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
