package model;

public class siparisModel {
    private int siparisId;
    private int kullaniciId;
    private int urunId;
    private String urunAdi;
    private int urunAdet;
    private double toplamFiyat;
    private String tarih;

    // Constructorlar, getter ve setter metotları
    public siparisModel() {
    }

    public siparisModel(int siparisId, int kullaniciId, int urunId, String urunAdi, int urunAdet, double toplamFiyat, String tarih) {
        this.siparisId = siparisId;
        this.kullaniciId = kullaniciId;
        this.urunId = urunId;
        this.urunAdi = urunAdi;
        this.urunAdet = urunAdet;
        this.toplamFiyat = toplamFiyat;
        this.tarih = tarih;
    }

    public int getSiparisId() {
        return siparisId;
    }

    public void setSiparisId(int siparisId) {
        this.siparisId = siparisId;
    }

    public int getKullaniciId() {
        return kullaniciId;
    }

    public void setKullaniciId(int kullaniciId) {
        this.kullaniciId = kullaniciId;
    }

    public int getUrunId() {
        return urunId;
    }

    public void setUrunId(int urunId) {
        this.urunId = urunId;
    }

    public String getUrunAdi() {
        return urunAdi;
    }

    public void setUrunAdi(String urunAdi) {
        this.urunAdi = urunAdi;
    }

    public int getUrunAdet() {
        return urunAdet;
    }

    public void setUrunAdet(int urunAdet) {
        this.urunAdet = urunAdet;
    }

    public double getToplamFiyat() {
        return toplamFiyat;
    }

    public void setToplamFiyat(double toplamFiyat) {
        this.toplamFiyat = toplamFiyat;
    }

    public String getTarih() {
        return tarih;
    }

    public void setTarih(String tarih) {
        this.tarih = tarih;
    }
}
