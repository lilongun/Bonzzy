package com.bonzzy.authserver.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.time.Instant;

@Data
public abstract class AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonIgnore
    private String createdBy;

    @JsonIgnore
    private Instant createdDate = Instant.now();

    @JsonIgnore
    private String lastModifiedBy;

    @JsonIgnore
    private Instant lastModifiedDate = Instant.now();


}
