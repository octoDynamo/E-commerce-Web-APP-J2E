package Entity;
public class Commande{
    private int id;
    private int utilisateur_id;
    private int produit_id;
    private int quantite;
    private String date;

    // Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getUtilisateur_id(int id) {
        return utilisateur_id;
    }
    public void setUtilisateur_id(int utilisateur_id) {
        this.utilisateur_id = utilisateur_id;
    }
    public int getProduit_id() {
        return produit_id;
    }
    public void setProduit_id(int produit_id) {
        this.produit_id = produit_id;
    }
    public int getQuantite() {
        return quantite;
    }
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
}
