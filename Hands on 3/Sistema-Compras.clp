;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BASE DE CONOCIMIENTOS - SISTEMA DE COMPRAS CLIPS ;;
;; Versión: Final con template de cliente con ID ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate smartphone
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio))

(deftemplate compu
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio))

(deftemplate accesorio
   (slot tipo)
   (slot precio))

(deftemplate cliente
   (slot id)    ;; Nuevo slot para el ID único del cliente
   (slot nombre)
   (slot tipo)) ; menudista o mayorista

(deftemplate orden
   (slot marca)
   (slot modelo)
   (slot qty)
   (slot banco)
   (slot grupo)) ; para tarjeta usada

(deftemplate tarjetacred
   (slot banco)
   (slot grupo)
   (slot fecha-expiracion))

(deftemplate vale
   (slot valor))

(deftemplate stock
   (slot marca)
   (slot modelo)
   (slot cantidad))

(deffacts hechos-iniciales

  ;; Smartphones
  (smartphone (marca apple) (modelo iPhone16) (color rojo) (precio 27000))
  (smartphone (marca apple) (modelo iPhone15) (color negro) (precio 23000))
  (smartphone (marca samsung) (modelo Note21) (color negro) (precio 25000))
  (smartphone (marca samsung) (modelo A54) (color azul) (precio 9000))
  (smartphone (marca xiaomi) (modelo RedmiNote12) (color plata) (precio 8500))
  (smartphone (marca motorola) (modelo edge30) (color gris) (precio 13000))

  ;; Computadoras
  (compu (marca apple) (modelo MacBookAir) (color gris) (precio 27000))
  (compu (marca apple) (modelo macbookpro) (color gris) (precio 47000))
  (compu (marca dell) (modelo Inspiron15) (color negro) (precio 18000))
  (compu (marca hp) (modelo Pavilion) (color blanco) (precio 16000))
  (compu (marca lenovo) (modelo ThinkPadX1) (color negro) (precio 21000))

  ;; Accesorios
  (accesorio (tipo funda) (precio 500))
  (accesorio (tipo mica) (precio 300))
  (accesorio (tipo cargador) (precio 700))
  (accesorio (tipo audifonos) (precio 1200))
  (accesorio (tipo cable-usb) (precio 200))
  (accesorio (tipo mouse) (precio 350))
  (accesorio (tipo mochila) (precio 1000))

  ;; Tarjetas de Crédito
  (tarjetacred (banco bbva) (grupo visa) (fecha-expiracion 01-12-23))
  (tarjetacred (banco banamex) (grupo oro) (fecha-expiracion 05-08-25))
  (tarjetacred (banco santander) (grupo mastercard) (fecha-expiracion 10-11-24))
  (tarjetacred (banco liverpool) (grupo visa) (fecha-expiracion 03-07-26))

  ;; Stock
  (stock (marca apple) (modelo iPhone16) (cantidad 50))
  (stock (marca apple) (modelo iPhone15) (cantidad 60))
  (stock (marca samsung) (modelo Note21) (cantidad 40))
  (stock (marca samsung) (modelo A54) (cantidad 80))
  (stock (marca xiaomi) (modelo RedmiNote12) (cantidad 100))
  (stock (marca motorola) (modelo edge30) (cantidad 30))
  (stock (marca apple) (modelo MacBookAir) (cantidad 30))
  (stock (marca apple) (modelo macbookpro) (cantidad 20))
  (stock (marca dell) (modelo Inspiron15) (cantidad 25))
  (stock (marca hp) (modelo Pavilion) (cantidad 15))
  (stock (marca lenovo) (modelo ThinkPadX1) (cantidad 18))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. REGLAS DE NEGOCIO (20)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 1. Clasificar como menudista si compra menos de 10
(defrule clasificar-menudista
   (orden (qty ?q&:(< ?q 10)))
=>
   (assert (cliente (id 1) (nombre Juan) (tipo menudista)))
   (printout t "Cliente ID " 1 " clasificado como MENUDISTA." crlf))

;; 2. Clasificar como mayorista si compra 10 o más
(defrule clasificar-mayorista
   (orden (qty ?q&:(>= ?q 10)))
=>
   (assert (cliente (id 2) (nombre Ana) (tipo mayorista)))
   (printout t "Cliente ID " 2 " clasificado como MAYORISTA." crlf))

;; 3. Descuento para mayoristas
(defrule descuento-mayorista
   (cliente (id ?id) (tipo mayorista))
   (orden (qty ?q))
=>
   (printout t "Cliente ID " ?id " recibe un Descuento: 10% aplicado por ser MAYORISTA." crlf))

;; 4. Recomendación para mayoristas
(defrule recomendacion-mayorista
   (cliente (id ?id) (tipo mayorista))
=>
   (printout t "Cliente ID " ?id " Recomendación: Cotiza volumen para beneficios adicionales." crlf))

;; 5. Recomendación para menudistas
(defrule recomendacion-menudista
   (cliente (id ?id) (tipo menudista))
=>
   (printout t "Cliente ID " ?id " Recomendación: Aprovecha promociones de accesorios y fundas." crlf))

;; 6. Descuento extra por usar tarjeta VISA
(defrule visa-desc-accesorios
   (orden (grupo visa))
=>
   (printout t "Promoción: 5% de descuento en accesorios con tarjeta VISA." crlf))

;; 7. Regalo cable USB por smartphone Samsung
(defrule samsung-regalo
   (orden (marca samsung))
=>
   (printout t "Regalo: Cable USB gratis por comprar Samsung." crlf))

;; 8. Mochila gratis por comprar smartphone y computadora
(defrule combo-mochila
   (orden (marca ?marca1) (modelo ?modelo1))
   (compu (marca ?marca2) (modelo ?modelo2))
=>
   (printout t "Promoción: Mochila gratis por compra combinada." crlf))

;; 9. Descuento por pago al contado (sin tarjeta)
(defrule contado-descuento
   (orden (banco nil))
=>
   (printout t "Descuento: 3% por pago en efectivo." crlf))

;; 10. Vale por compra mayor
(defrule bono-gran-compra
   (orden (qty ?q&:(>= ?q 2)))
=>
   (assert (vale (valor 1000)))
   (printout t "Bono: $1000 en vales por compra grande." crlf))

;; 11. Seguro gratis por comprar MacBook Air
(defrule seguro-macbook
   (orden (modelo MacBookAir))
=>
   (printout t "Incluye: Seguro gratis 1 año con MacBook Air." crlf))

;; 12. Descuento por comprar productos Apple
(defrule apple-descuento
   (orden (marca apple))
=>
   (printout t "Descuento: 5% aplicado en productos Apple." crlf))

;; 13. Envío exprés con BBVA Visa
(defrule bbva-envio
   (orden (banco bbva) (grupo visa))
=>
   (printout t "Beneficio: Envío exprés gratis con BBVA VISA." crlf))

;; 14. Envío gratis de accesorio con smartphone
(defrule accesorio-envio-gratis
   (orden (marca ?m))
   (accesorio (tipo ?a))
=>
   (printout t "Promoción: Envío gratis de accesorio junto a smartphone." crlf))

;; 15. MSI en MacBook Pro con BBVA
(defrule macbookpro-msi
   (orden (modelo macbookpro) (banco bbva))
=>
   (printout t "Oferta: 6 MSI en MacBook Pro con BBVA." crlf))

;; 16. Oferta especial iPhone16 con Banamex Oro
(defrule iphone16-banamex
   (orden (marca apple) (modelo iPhone16) (banco banamex) (grupo oro))
=>
   (printout t "Oferta: 24 meses sin intereses con Banamex en iPhone16." crlf))

;; 17. Oferta Note21 con Liverpool VISA
(defrule note21-liverpool
   (orden (marca samsung) (modelo Note21) (banco liverpool) (grupo visa))
=>
   (printout t "Oferta: 12 MSI con Liverpool VISA en Note21." crlf))

;; 18. Accesorios con 15% de descuento por smartphone
(defrule accesorios-descuento
   (orden (marca ?marca))
=>
   (printout t "Promoción: 15% de descuento en funda y mica por comprar smartphone." crlf))

;; 19. Actualizar stock
(defrule actualizar-stock
   ?o <- (orden (marca ?marca) (modelo ?modelo) (qty ?q))
   ?s <- (stock (marca ?marca) (modelo ?modelo) (cantidad ?exist))
   (test (>= ?exist ?q))
=>
   (retract ?s)
   (bind ?nuevo (- ?exist ?q))
   (assert (stock (marca ?marca) (modelo ?modelo) (cantidad ?nuevo)))
   (printout t "Stock actualizado de " ?marca " " ?modelo ": " ?nuevo " unidades." crlf))

;; 20. Valido: MacBook Air + iPhone15 al contado → $100 x cada $1000
(defrule macbookair-iphone15-vales
   (orden (marca apple) (modelo iPhone15) (qty ?q) (banco nil))
   (compu (marca apple) (modelo MacBookAir))
=>
   (bind ?total (* ?q (+ 23000 27000)))
   (bind ?vales (* (div ?total 1000) 100))
   (assert (vale (valor ?vales)))
   (printout t "Promoción: $" ?vales " en vales por compra conjunta." crlf))