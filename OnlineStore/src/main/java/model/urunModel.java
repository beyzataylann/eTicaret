package model;

public class urunModel {

    private int urunKodu;
    private String urunAdi;
    private String urunDetay;
    private int urunFiyat;
    private int urunAdet;
    private String urunFotograf; // Değiştirilen alan adı
    private int kategoriKodu; // Kategoriye ait kod

    public urunModel(int urunKodu) {
        this.urunKodu = urunKodu;
    }

    public urunModel(int urunKodu, String urunFotograf, String urunAdi, int urunFiyat) {
        this.urunKodu = urunKodu;
        this.urunFotograf = urunFotograf;
        this.urunAdi = urunAdi;
        this.urunFiyat = urunFiyat;
    }

    public urunModel(String urunAdi, String urunDetay, int urunFiyat, int urunAdet, String urunFotograf, int kategoriKodu) { // Değiştirilen alan adı
        this.urunAdi = urunAdi;
        this.urunDetay = urunDetay;
        this.urunFiyat = urunFiyat;
        this.urunAdet = urunAdet;
        this.urunFotograf = urunFotograf; // Değiştirilen alan adı
        this.kategoriKodu = kategoriKodu;
    }

    public urunModel(int urunKodu, String urunAdi, String urunDetay, int urunFiyat, int urunAdet, String urunFotograf, int kategoriKodu) { // Değiştirilen alan adı
        this.urunKodu = urunKodu;
        this.urunAdi = urunAdi;
        this.urunDetay = urunDetay;
        this.urunFiyat = urunFiyat;
        this.urunAdet = urunAdet;
        this.urunFotograf = urunFotograf; // Değiştirilen alan adı
        this.kategoriKodu = kategoriKodu;
    }

    public String getUrunFotograf() { // Değiştirilen metot adı
        return urunFotograf;
    }

    public void setUrunFotograf(String urunFotograf) { // Değiştirilen metot adı
        this.urunFotograf = urunFotograf;
    }

    public int getKategoriKodu() {
        return kategoriKodu;
    }

    public void setKategoriKodu(int kategoriKodu) {
        this.kategoriKodu = kategoriKodu;
    }

    public int getUrunKodu() {
        return urunKodu;
    }

    public void setUrunKodu(int urunKodu) {
        this.urunKodu = urunKodu;
    }

    public String getUrunAdi() {
        return urunAdi;
    }

    public void setUrunAdi(String urunAdi) {
        this.urunAdi = urunAdi;
    }

    public String getUrunDetay() {
        return urunDetay;
    }

    public void setUrunDetay(String urunDetay) {
        this.urunDetay = urunDetay;
    }

    public int getUrunFiyat() {
        return urunFiyat;
    }

    public void setUrunFiyat(int urunFiyat) {
        this.urunFiyat = urunFiyat;
    }

    public int getUrunAdet() {
        return urunAdet;
    }

    public void setUrunAdet(int urunAdet) {
        this.urunAdet = urunAdet;
    }
}
