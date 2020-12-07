package org.motaouia.gestioncinema.models;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data @NoArgsConstructor @AllArgsConstructor
public class Ville implements Serializable{
	@Id
	@GeneratedValue
	private Long id;
	private String name;
	private double longitude, altitude, latitude;
	@OneToMany(mappedBy = "ville")
	private Collection<Cinema> cinemas;

}
