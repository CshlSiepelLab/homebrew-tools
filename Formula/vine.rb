class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5fe8f42a6ca84908d2d8f9416120526e4dc007a6ac0c2d7ead3d8d16f485c7ac"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "phast"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DPHAST_ROOT=#{Formula["phast"].opt_prefix}"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    system "#{bin}/vine", "--help"
  end
end
