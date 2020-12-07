package org.motaouia.gestioncinema.dao;

import org.motaouia.gestioncinema.models.Ville;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface VilleRepository extends JpaRepository<Ville, Long>{

}