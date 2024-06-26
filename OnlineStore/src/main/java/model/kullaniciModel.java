package model;

public class kullaniciModel {
    private String kullaniciAdi;
    private String kullaniciSifre;
    private String ad;
    private String soyad;
    private String telefonNumarasi;
    private String kullaniciMail;
    private String kullaniciAdres;

    // Constructor
    public kullaniciModel(String kullaniciAdi, String kullaniciSifre, String ad, String soyad, String telefonNumarasi, String kullaniciMail, String kullaniciAdres) {
        this.kullaniciAdi = kullaniciAdi;
        this.kullaniciSifre = kullaniciSifre;
        this.ad = ad;
        this.soyad = soyad;
        this.telefonNumarasi = telefonNumarasi;
        this.kullaniciMail = kullaniciMail;
        this.kullaniciAdres = kullaniciAdres;
    }

    // Getters and Setters
    public String getKullaniciAdi() {
        return kullaniciAdi;
    }

    public void setKullaniciAdi(String kullaniciAdi) {
        this.kullaniciAdi = kullaniciAdi;
    }

    public String getKullaniciSifre() {
        return kullaniciSifre;
    }

    public void setKullaniciSifre(String kullaniciSifre) {
        this.kullaniciSifre = kullaniciSifre;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getTelefonNumarasi() {
        return telefonNumarasi;
    }

    public void setTelefonNumarasi(String telefonNumarasi) {
        this.telefonNumarasi = telefonNumarasi;
    }

    public String getKullaniciMail() {
        return kullaniciMail;
    }

    public void setKullaniciMail(String kullaniciMail) {
        this.kullaniciMail = kullaniciMail;
    }

    public String getKullaniciAdres() {
        return kullaniciAdres;
    }

    public void setKullaniciAdres(String kullaniciAdres) {
        this.kullaniciAdres = kullaniciAdres;
    }
}
