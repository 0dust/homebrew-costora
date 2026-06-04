class CostoraAgent < Formula
  desc "Metadata-only Costora local agent for PR cost receipts"
  homepage "https://github.com/costora"
  url "https://github.com/0dust/homebrew-costora/releases/download/v0.1.2/costora-agent-release.tar.gz"
  sha256 "4a55d1d2534d410c3faf26770f5bd00241b1ef84664e3ce61b4df04513bc74b0"
  version "0.1.2"

  depends_on :macos

  def install
    artifact = Hardware::CPU.intel? ? "costora-agent_darwin_amd64" : "costora-agent_darwin_arm64"
    bin.install artifact => "costora-agent"
  end

  test do
    output = shell_output("#{bin}/costora-agent version")
    assert_match "costora-agent", output
    refute_match(/token|secret|api_key|prompt|completion|transcript|raw_jsonl|raw_otel|diff|patch/i, output)
  end
end
