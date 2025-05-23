;; Intersection Verification Contract
;; Validates and manages traffic control points

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))

;; Data structures
(define-map intersections
  { intersection-id: uint }
  {
    location: (string-ascii 100),
    verified: bool,
    last-updated: uint,
    traffic-lights: uint,
    created-by: principal
  }
)

(define-map intersection-status
  { intersection-id: uint }
  {
    operational: bool,
    maintenance-required: bool,
    last-check: uint
  }
)

(define-data-var intersection-counter uint u0)

;; Public functions
(define-public (register-intersection (location (string-ascii 100)) (traffic-lights uint))
  (let ((intersection-id (+ (var-get intersection-counter) u1)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (is-none (map-get? intersections {intersection-id: intersection-id})) err-already-exists)

    (map-set intersections
      {intersection-id: intersection-id}
      {
        location: location,
        verified: false,
        last-updated: block-height,
        traffic-lights: traffic-lights,
        created-by: tx-sender
      }
    )

    (map-set intersection-status
      {intersection-id: intersection-id}
      {
        operational: true,
        maintenance-required: false,
        last-check: block-height
      }
    )

    (var-set intersection-counter intersection-id)
    (ok intersection-id)
  )
)

(define-public (verify-intersection (intersection-id uint))
  (let ((intersection (unwrap! (map-get? intersections {intersection-id: intersection-id}) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)

    (map-set intersections
      {intersection-id: intersection-id}
      (merge intersection {verified: true, last-updated: block-height})
    )
    (ok true)
  )
)

(define-public (update-status (intersection-id uint) (operational bool) (maintenance-required bool))
  (let ((intersection (unwrap! (map-get? intersections {intersection-id: intersection-id}) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)

    (map-set intersection-status
      {intersection-id: intersection-id}
      {
        operational: operational,
        maintenance-required: maintenance-required,
        last-check: block-height
      }
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-intersection (intersection-id uint))
  (map-get? intersections {intersection-id: intersection-id})
)

(define-read-only (get-intersection-status (intersection-id uint))
  (map-get? intersection-status {intersection-id: intersection-id})
)

(define-read-only (get-intersection-count)
  (var-get intersection-counter)
)
