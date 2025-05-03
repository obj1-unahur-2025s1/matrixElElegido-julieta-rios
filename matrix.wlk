object neo {
    var energia = 100
    
    method esElElegido() = true

    method saltar() {energia = energia * 0.5} //energia - energia/2

    method vitalidad() = energia * 0.1
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method vitalidad() = vitalidad

    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado
    }
    
    method estaCansado() = estaCansado

    method esElElegido() = false
}

object trinity {
    method vitalidad() = 0
    method saltar() {}
    method esElElegido() = false
}

object nave {
    const pasajeros = #{neo, morfeo, trinity} //property pasajeros = [neo, morfeo, trinity]

    method cantPasajeros() = pasajeros.size()

    method pasajeroMasVital() = pasajeros.max{p=>p.vitalidad()}
    
    method pasajeroMenosVital() = pasajeros.min{p=>p.vitalidad()}

    method estaEquilibrada(){
        return self.pasajeroMasVital().vitalidad() <=
                self.pasajeroMenosVital().vitalidad()*2

    }

    method hayElegido() = pasajeros.any{p=>p.esElElegido()}

    method chocar() {
        pasajeros.forEach{p=>p.saltar()}
        pasajeros.clear()
    }

    method acelerar() {
        self.pasajerosSinElElegido().forEach{p=>p.saltar()} //pasajeros.filter{p=>!p.esElElgido()}.forEach{p=>p.saltar()}
        pasajeros.remove(neo)
    }

    method pasajerosSinElElegido() = pasajeros.filter{p=>!p.esElElgido()}
}