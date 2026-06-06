class CostoraAgent < Formula
  desc "Metadata-only Costora local agent for PR cost receipts"
  homepage "https://github.com/costora"
  url "https://github.com/0dust/homebrew-costora/releases/download/v0.1.4-dev.20260606.1/costora-agent-release.tar.gz"
  sha256 "24d7833d77bab86df25aa2be025558f500f692e8f4d45dfcd0ed6eacaf2296a3"
  version "0.1.4-dev.20260606.1"

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
